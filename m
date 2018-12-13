Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXVqa-0000uA-UM
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 13:36:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVqW-0000s0-Ch
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 13:36:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVqU-0006SU-Pw
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 13:36:28 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:31496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87864c7eb=Alistair.Francis@wdc.com>)
	id 1gXVqP-00065d-06; Thu, 13 Dec 2018 13:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544726181; x=1576262181;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=YU1HWpvAEdcJKii7MeuyyMvIG/ZR4GP8y2/jYzZEvCo=;
	b=H1KillgfNGaz3fh4qndhU5zi2/Kd2z95MeoHqzMs75jxFyVgQRz+hz1X
	nZoMdzd2BDOJphCJzhxWyHYTRHp3bwcxAoQPVvWZ0IxKI6v5ehygwM2tN
	UQ6RCWAy1xy8Ay2VykH5G4ewQYBaFe0ptwr9sVQRZqrXFA7Vxtk2B/THO
	epcPOPUjAvNz6BYeTANW81mDlnJGPWeGPoCFSg862IEx8XtFa7t9aM/B5
	9M3gHxXxnbW3zvrOU2a40vRJZBEibLTrQLJFwmehYF/fxWJBo/lPS/PwJ
	oB4niVvmL4CK+YpNWe5XdoSnIf5dwNKmArXDTtQw/2vFIyR4vZEq8j0FY Q==;
X-IronPort-AV: E=Sophos;i="5.56,349,1539619200"; d="scan'208";a="97753234"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 02:36:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dcx/6nhVCN+QhMwHFEr+FLbFEn8qIa8/CdWHX/UjdCQ=;
	b=eKf3DXeG6xwu9dQ9WH3k35aujuFy6E8h93qYd2dAsoMnZvbpUuV5Mc+ZzXLuOIEX2S4xIy345xtLUpxeNBEEIJaXKtrdVmYuRqY6+p9VyTRr9uAP0uX8h6/vkosy6LHB52wNdqg9cd9Cbm5Zj8jEVwntneuHrHc6Ppwny3zTTKE=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1198.namprd04.prod.outlook.com (10.173.48.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Thu, 13 Dec 2018 18:36:17 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Thu, 13 Dec 2018 18:36:17 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, Anup Patel <Anup.Patel@wdc.com>
Thread-Topic: [PATCH v1 1/1] sifive_u: Set 'clock-frequency' DT property for
	SiFive UART
Thread-Index: AQHUkxK7T27quti4y0SKXVsUgkWooQ==
Date: Thu, 13 Dec 2018 18:36:17 +0000
Message-ID: <b67c23ca669530709501412a8daf4bb7f90ecc8c.1544726124.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0057.namprd05.prod.outlook.com
	(2603:10b6:a03:74::34) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1198;
	6:1w9Dg1fyvH8xHSnI06M9X0iF865EaFfdlsTRMilqHI2khdQIl2/3VjWyaE7aH7jO6UM6271Ftk2jDT/oi9grv8C+WNcVLVbvPdHaEDb2u/F+CLXk7Tno9U6Er7rLUe7zmSAf4hwKak05CoCbZPhv17IKNzLUuW8sD0N7M/FnANnoQ2O9AcpbbpgZO56fr8MopStn4116/cI19OHBj7qrpPVgcwWf6CsLDUZG21VN6DFhDDaf9XPzkBAQdf++vgTb3BaiSkF+94zX5oqzFrUZVEKQhz+KvNXcI5Xl9LQw0eTfqCsyThj4xn0k+ZjIIWmGq8ZS18F//S9Pa7rbn71/0Vsv3vpG0N1FoAxabdPaF/C+FNlwIUsoWytJzuonRfSvIuuDUiScOIBJtNCzb/pmZy+Tk7Rq4HhqoTWl2zo/s7biK9oseeQvjZKtcbrSri379SgwWxmDqs1QK2+2wQjUAg==;
	5:59Oi1hUGjxJ6dLP6qtC6EAai5EjzAL3+Z13XXMyXNCOe2aj1jajed+B4ZoQ/uM59R0bQ0Cwo1KUXa1k4FnA3j3qZIh2w1ntB+/PJiUiEI2jJYHYaMx/TZRmbV9ucrC6vwhz/nm795oUw1OD+HB4n3CXCsxFQMtreB+idAtmpJQc=;
	7:zAlhaRVFSOnwf8WM/OHzD/me2m2Q6frumXWj3DJgziESGbSIoooLPuwJG7fJWfu8E4PU3g6MT2eGpW9v8Ep9SbrvSCGf3b6ER5RtKFmyzC5gES7gFokh6Bats764uTDVbmJNT7CAIHh3gLFj584sCw==
x-ms-office365-filtering-correlation-id: 29e27d47-a4e3-433d-b06f-08d66129de3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1198; 
x-ms-traffictypediagnostic: MWHPR04MB1198:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1198B0FA31A560AC2BE1A8A390A00@MWHPR04MB1198.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1198; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1198; 
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6029001)(376002)(366004)(396003)(136003)(346002)(39860400002)(189003)(199004)(102836004)(99286004)(386003)(486006)(26005)(2616005)(44832011)(72206003)(6506007)(476003)(71190400001)(71200400001)(4326008)(86362001)(478600001)(52116002)(39060400002)(6512007)(53936002)(97736004)(68736007)(110136005)(25786009)(316002)(54906003)(186003)(256004)(36756003)(118296001)(6486002)(8676002)(2906002)(6116002)(305945005)(8936002)(81156014)(50226002)(81166006)(3846002)(105586002)(6436002)(2501003)(5660300001)(66066001)(106356001)(7736002)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1198;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: f/ucQj2deVJt0kEVW9+GZb2pq+eJFuR9KY4fAaV+XAMeNwLwbT6iByVfPhWS5pbtkWsy/gj0hHv728q0KnrfaIXr43f85+645Wq5wdiWxlT0SCcNSrMgDIVCYWZ1GRwCVf8+oykKxYo8Tszuun51hRd0JxO+KpvtPxIF5l3esTEebQU2A6Pc9kuRK7ERZ2gF2j2AhQW6iNv4o4/KkfB4eMDNEsHy+9nea04YZ5UXUroqTRlOblGnpe4QYEGDX/9RKEhqxtTVmG0aZTXi5KdUkirMWI1H/LQ/AzpqT0RreDRcVZMjbv1hTuNDymATnvl3
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e27d47-a4e3-433d-b06f-08d66129de3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 18:36:17.2454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1198
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 1/1] sifive_u: Set 'clock-frequency' DT
 property for SiFive UART
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
X-List-Received-Date: Thu, 13 Dec 2018 18:36:31 -0000

From: Anup Patel <anup@brainfault.org>

The 'clock-frequency' DT property is required by U-Boot to compute
the divider value. This patch sets the 'clock-frequency' DT property
of the SiFive UART device tree node (similar to virt machine).

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df2442..f30bbfd1d6 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -225,6 +225,8 @@ static void create_fdt(SiFiveUState *s, const struct Me=
mmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+                          SIFIVE_U_CLOCK_FREQ / 2);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle=
);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
=20
--=20
2.19.1


