Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPK-0004fs-HG
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLg-0001Fv-BA
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLc-0003Yf-Gu
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:18:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:6761)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcLW-00035Y-7l; Tue, 30 Oct 2018 18:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937926; x=1572473926;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=HiRR7JSoj/9Xmc0XL3OjejDCyZ8/2qZrhh9xiFs291E=;
	b=EMvKNq1dF3/Hfvm2Qn6WOKqRfD/G2jY4Z2jzPg945uUpdgB4N9M45w+q
	2qt/9KmEJnonYgJeayklSooVL/abuo7aJTRq8fyg95RP1Y2/0MhnAGHe3
	36SnHZVa7Zv4pSesTCiLFuKF9Nu9PstyM5h1YQnSsaqsQkgJS/M06hOZ6
	QMVX+21zTIqzpnDOQAxNrYEdoQaM27xB757QbqPpdoyPvziAgzVIjCMBO
	gMHxmwGhpXKR5fF5bkRgb2ojjvrQRzON53dr7abOEXYriujzvGgPavMHR
	0P86tBxA19OiXsdGkIQx+mpzHFxJ2jEf9GEjcTmOlygD8y4uAbJwewfgG A==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="93157952"
Received: from mail-sn1nam02lp0021.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.21])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:18:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HiRR7JSoj/9Xmc0XL3OjejDCyZ8/2qZrhh9xiFs291E=;
	b=OJR41dshIcmrFqZmAeGPFhpTaq+xLklda844L9I/YFVaRytBwV5GFFug5pGXZDXIYlQeVGQHTgD8n2+FMn8KEqYjjINCS/b7hz/OjyEfCiFWyHZh8mylXXHZeVseZmjJ/FdHXCOkc71t9PHKbUj9TOkvpWQ7j7t783GkQFtAPH4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0239.namprd04.prod.outlook.com (10.169.202.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Tue, 30 Oct 2018 22:18:09 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:18:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 3/5] riscv: Enable VGA and PCIE_VGA
Thread-Index: AQHUcJ5wzmW6NU6gKEWEHo/9PNCsUw==
Date: Tue, 30 Oct 2018 22:18:08 +0000
Message-ID: <a49aeee9f023c09b51bc39856f9b68df5a3607f4.1540937826.git.alistair.francis@wdc.com>
References: <cover.1540937826.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0013.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::26) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0239;
	6:8nu/N2RQUlYv2t/QC0z/rffADJDv5Mp06e1wzStfCVdvtDgje8+t2PEbOcplrVyg97oJtfxzIFvFGr+xQoV6psKdIwdSV5c2U7XETm7BJlkv320evOOTlXudojxC8TBjpdIfo9B/j0soqi/2LfBwEwM6yuO5ErT4ELCmyMFaIwYy/OU9m4XAsIpz8I2BagfJBh8VAUyoikfOn/ho2v/MFBs+R1hDaMESequpv2XGVvUmDaZeAqbuWJIxWJl7kv/aatKwpP8h0Fy7u96Xj4WLM0cF5uIOpcvo7pC2x+079QUiZi86DTT4IU8vhZKScwgJ1HEhMYGF/Wwhl5AooTxgJ6wP8QcgoN6/Fd5M1VrEJngLq1jVdUw+kW3YSgUb+Xytn0zz0A1nne/6881r8Szqj/oVcr2bc27Zd0O1Uj6ZAcz7w1STqruDjuWKloVJMflyAbCUTTRbvqIonIsx9WU7qA==;
	5:V3QZlIuRpNQ0nQx2Eci3UokC5F1HEjl/sv8yzIg+sjFnFk200FB47qEJTLBBjeCIH33BIAsWW64MbR1QHvv9JY02BQtTcoGQXiPlVFnNI+o2qz+1xNVS0kWHf7qKS8pY6PAelgMe/Z3MTWr1UUwF7mnHvsc5bmO9iuF/3QFF4kc=;
	7:btSFgikw1RgkykylMdRfIZWS8mvwrE+RuxLREiZsg2Mlon+93SNKfx+YNxe7Wq4I6GkmazhzyZcspVqIsBtJ4Xi5jjVVsW8yQ9wJ1HnqHQr/xR6UKefOTYLvEBzeFdtM8mKN1+taZPAB6YesSrWBsw==
x-ms-office365-filtering-correlation-id: 2064811d-8b0c-453f-5aa5-08d63eb59253
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0239; 
x-ms-traffictypediagnostic: MWHPR04MB0239:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0239CDF166CCBB53D119450090CC0@MWHPR04MB0239.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0239; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0239; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(376002)(396003)(366004)(39860400002)(199004)(189003)(76176011)(476003)(256004)(118296001)(25786009)(6512007)(4326008)(66066001)(72206003)(44832011)(8676002)(14454004)(486006)(478600001)(5660300001)(81166006)(68736007)(99286004)(81156014)(6486002)(52116002)(6436002)(2900100001)(2906002)(2616005)(3846002)(11346002)(446003)(6116002)(110136005)(102836004)(36756003)(53936002)(2501003)(71200400001)(54906003)(97736004)(26005)(105586002)(316002)(7736002)(8936002)(186003)(386003)(39060400002)(6506007)(71190400001)(50226002)(5250100002)(106356001)(305945005)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0239;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: e4CC6RQHOGySEIyhC4/IZxyUDvVVzuhW3goBzTuFpM2veYLWuKMt5cxy3l65l1z8QTjp7mM+UeqfGZb4VuFTN6lut5smtfhGKl3H0xhTfq9qK6q9folgunMw7utOpheflVVbW9iyPBEN2qV+oPellI+eb8PtCATJaX+iTsWxGC3lMaDmY21Wvde4CXuVJacPTkLRLk+MyarHlvX3SoFkH9SFMTZCoUlAt/A8vZi2KuzkL/PLa5ArmH+zrxcHYLKAAhIb91+BMt1B5QljkZJGIyO7e2Rqjsf44r6Krj3Ox4ngjte7AQ7+1VWme7TEdZTAX/dDZo2sV9/CHjtPZanqu1Sp4v8tpdIdAnHtlvZcH+U=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2064811d-8b0c-453f-5aa5-08d63eb59253
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:18:08.8496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0239
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 3/5] riscv: Enable VGA and PCIE_VGA
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
X-List-Received-Date: Tue, 30 Oct 2018 22:18:59 -0000

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


