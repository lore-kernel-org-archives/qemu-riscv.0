Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVu6-0005FS-IM
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:03:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu0-00056f-Jk
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtu-0007um-N7
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:00 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:55584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtr-0007nv-7K; Wed, 21 Nov 2018 12:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819771; x=1574355771;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=HiRR7JSoj/9Xmc0XL3OjejDCyZ8/2qZrhh9xiFs291E=;
	b=JFKRaqv0kAkxOKIYxfYwd5DjQcXZtjTpmZG1RkhrAO3rBwwKDWYKfgQZ
	WQBecntyw7iybFQejOeAwXQoTmNBNNU8lPqh3WmPiyBa84iroLYM5xv0F
	StpF7izZyo/tWtxH06Odzi+kXOJqZr/QH9HrBmr/IXBy7mUsLHB1mLmVb
	RoN4wsStOoWXPbVOCQOfyqbPiX8YA6GaDuHjziifHQ7tLUVvn/xpbzGV+
	55FqMIzhLW4aYhhJj2LMb5mAzjm52UeQzxK9+v+gUImMnKsrqL3byRsGT
	DiKxAxHXa/QsDDZwVvacBomxWpM4jiunNvjVMH6KrAK3YTr+ohqwrd2OT w==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="199379996"
Received: from mail-bn3nam04lp0114.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.114])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HiRR7JSoj/9Xmc0XL3OjejDCyZ8/2qZrhh9xiFs291E=;
	b=BXyJ0HISQzJR2elztyvgmBB/CfnkGaDy+46wMIt3j1xMkIEZzH8Aw7Nv7aPTQIKxlVQ5W6afibHCGS13nnkKnvaajlN54YrGh3MYJ1Bao9oXN+mdFrBK3W2LTpzgHcM3XbFmVt2tquv5UDADRwxbMq7P/iSAaGW0KwMcF/Ssft4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:02:45 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:45 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 4/6] riscv: Enable VGA and PCIE_VGA
Thread-Index: AQHUgbwGeeiJTeh4jEaUpN8PYzmHLw==
Date: Wed, 21 Nov 2018 17:02:45 +0000
Message-ID: <4120d0a7e4fe6f3fd6bdd6c084a40a67a48be374.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:l+6V+3uNhqOqPeTRVILyP37JVD4KmrEHOKa4saciQo8To0f50eDJqkyiSxc2LikfNCwoDbIgTxYkMiydj63NMfkjDijM6G8rPCeGKvLDpqkrOGGebCtqtcqXQBxsCjrYQfNheXx1pdLtc5jEUnk0TuvwPPMVzhRmbOimaUsqHNEvmbs30uELI8kl5Pj0T95Qhny0vffCpGQqMlSIsJ3FtaFOWxHL0aVu0nXrgUNpZyjITWRRJ4b79T0/1MvHQGYAI4MOUE6MLLSJZY6QPRxha2x8yCdMvR1dyn3CxSWOJoKI/+bDNMlIpClEwe9mAXaIO2zVHYhTdgI+lStJjPbjLN6NPA8622RN6gDYIbJ+nMZZWF4HgUgvjNvJgqKFiCUu7fEl77txiA7JmIztcaYFBKlKFwlezFOOjPhBmghG526k70cGuD/AW01VUoti/5tIO/joOmstpgnpTcesiI5yFg==;
	5:rarF29wCnAGFioBwDB+aEh5WrmNajQC3zchIlBl/B96pSMtf3KE/NgQSOTaUMMt0ZqQEk2J1WMsBA4KJDjSyGz0TMO16UQ7rS2AYMQlTUu/BJPG3+c2J+rnkaFOiYkqhFjw70DA5tpkN1yv0H2+Tk+442w5YqlWAbsyMbdAIZfY=;
	7:325c0ixURJvlnWgbr0gj1qUNVLHaGuXnpziMx4yRrPo5wGqIawWsJGORxY+LDL4pJLnBSDu6eRuvuzSbo4YZCilAvmvQTTV2nadI1aBgKS03ZNe0g59xu0udV/6QwrM93+12lKGNy2/AdRlwl+OKTQ==
x-ms-office365-filtering-correlation-id: 54d6b998-2444-43be-d5f0-08d64fd32856
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1249EAABB22D0350F6EE5A8590DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1249; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1249; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(36756003)(72206003)(97736004)(305945005)(68736007)(2906002)(71200400001)(86362001)(71190400001)(8676002)(7736002)(106356001)(478600001)(105586002)(39060400002)(6512007)(102836004)(3846002)(2900100001)(76176011)(14454004)(25786009)(52116002)(8936002)(118296001)(44832011)(6116002)(186003)(50226002)(6486002)(476003)(66066001)(316002)(2616005)(26005)(5660300001)(486006)(2501003)(81156014)(81166006)(4326008)(386003)(6506007)(110136005)(54906003)(256004)(11346002)(99286004)(446003)(6436002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1249;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: n5+vGIw6P9E+uxP0JMxmghmAR0tg2DLmQWky34+uwbLwuo0SvgHiRBqaFLSWSVJPUVALwEqPcwXhmAu4hHzJv2B7R2hmP6S5X4muLjAnkkHb+emgruTmTa/rj6qF1KsobGTif2zhYjnxCgMKtsNiULjXMYa7mo8voLlycgmq0iKGEMl8n+YQglF4zMD00FZuS2WnJglDgkoil3kroems9ULXCaH2UmdCiG3ftxIQiI1aTx5nIz2Ikf+fgP5/bk6Of794gTBy8ncM5saj+2rGLeJxUQWiLTAOen+i5Lc38sEhQqKwvO8HEjBekr+oY68CdIP1XwhFI9g1akh0dcl7ybPQfjCeEsPsS1GZA0l1HWE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d6b998-2444-43be-d5f0-08d64fd32856
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:45.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for-3.2 v7 4/6] riscv: Enable VGA and PCIE_VGA
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:03 -0000

Enable compile support for VGA devices. This allows the user to conenct
a display by adding '-device bochs-display -display sdl' to their
command line argument.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/riscv32-softmmu.mak | 3 +++
 default-configs/riscv64-softmmu.mak | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index 3e3d195f37..05fae82f1b 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -9,3 +9,6 @@ CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
 CONFIG_PCI_XILINX=3Dy
+
+CONFIG_VGA=3Dy
+CONFIG_VGA_PCI=3Dy
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-=
softmmu.mak
index 3e3d195f37..05fae82f1b 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -9,3 +9,6 @@ CONFIG_CADENCE=3Dy
=20
 CONFIG_PCI_GENERIC=3Dy
 CONFIG_PCI_XILINX=3Dy
+
+CONFIG_VGA=3Dy
+CONFIG_VGA_PCI=3Dy
--=20
2.19.1


