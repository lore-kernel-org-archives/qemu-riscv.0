Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4tGW-0000lE-Vw
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 16:17:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=970a2778b=Alistair.Francis@wdc.com>)
	id 1h4tGU-0000Sr-6e
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 16:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=970a2778b=Alistair.Francis@wdc.com>)
	id 1h4t5R-0000n8-Tn
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 16:05:51 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:65166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=970a2778b=Alistair.Francis@wdc.com>)
	id 1h4t5Q-0000i2-O9; Fri, 15 Mar 2019 16:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552680349; x=1584216349;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=SV6qcN2EuyIRTTINh5tSts9WXA3ojbL/b4m1Z5Xd4YU=;
	b=TNYcHlRZEwzvhsv2j2secKE92OyiQCyc6YPxLrg4JGra2swXH4q+FYy/
	uyAjJbgvR+9dS9s1Bu4f+jhCCHPgoy9H0dnAf3/PGd4B1X+Pthh7JYrW2
	NwPzfB+81rmASMcDBR/3AhYBj2ZiiiQOvyIUc5AV7KCBVQEVWsT/8qVVN
	1kzP7AisnWF1D9Dw/J9xiVuwATNmSVUvldtRvd24EgXibcpgLcn4zjl4a
	p2ktCg0YT7NDrWJ6Z0kCuI1pNTj+MwUmsAxolhGJtNRkUIH3n2BowlgRP
	JA+Adl607BQgmIr2eUnYLA6YL9ssfhrhDsr8JEDlYZLtrRNXDFV8/8Bsh w==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="108585831"
Received: from mail-sn1nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.53])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 04:05:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HtRSXWfFDMWMmNU9ZWML+MbmQ2ug1AkiqgqTHbgAqrI=;
	b=KxzmE7Sz0DXCDwNPJv3KNWVwcJfGPNcM+5BSVhxQ2yScieJL3f/lHiXSRB4t4IRfNoBI6zVcs5rEXPaZqZtQwYgrO6gva9qKNtiiMYTsMlbQQ0LSM6zFpg5Cepn6JlpXEOf7pSAJMKYVi5btxGvrFmAt424YyfgZrpqX6wUr1cU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5784.namprd04.prod.outlook.com (20.179.58.94) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Fri, 15 Mar 2019 20:05:36 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Fri, 15 Mar 2019 20:05:36 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>, 
	"david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
	"rjones@redhat.com" <rjones@redhat.com>, "abologna@redhat.com"
	<abologna@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Thread-Topic: [PATCH v1 1/1] riscv: plic: Set msi_nonbroken as true
Thread-Index: AQHU22p0VX9VENMgmUG2gHlbXISBiA==
Date: Fri, 15 Mar 2019 20:05:36 +0000
Message-ID: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
	To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50d11acb-c3c8-4183-47a4-08d6a981964d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5784; 
x-ms-traffictypediagnostic: BYAPR04MB5784:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5784EB8DC971E0BE9C9E49F390440@BYAPR04MB5784.namprd04.prod.outlook.com>
x-forefront-prvs: 09778E995A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(136003)(346002)(39860400002)(396003)(199004)(189003)(71200400001)(71190400001)(6116002)(256004)(3846002)(305945005)(7736002)(72206003)(102836004)(6506007)(386003)(50226002)(8936002)(99286004)(478600001)(52116002)(97736004)(6436002)(6306002)(6512007)(6486002)(118296001)(5660300002)(486006)(4326008)(2616005)(44832011)(476003)(25786009)(966005)(53936002)(106356001)(86362001)(105586002)(66066001)(110136005)(316002)(2906002)(14454004)(14444005)(2501003)(8676002)(81166006)(36756003)(26005)(186003)(54906003)(68736007)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5784;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Iu+UI2h5+1ckQSJf961ACBnd+85FvU4pbTBiY6cIf7niQpW1SmSqOXjrYSsVDvwqVsHk5hI0yJ1FXTxTks3tFgUgOZ7k1JnEg2xEJgXYRyjg381+/NwBIqUMBwnkgkgAlPZNQXX6PKLDf7eJ75cym9OQaQjVcZGxB9CHAXbb/D2Ja8qfDPm2fMswz5SkHY0y7UlDsQriGOR8zV1qhPZB7KZDUj8nvSbJ5IQgyIrzu6WCA1QorMIciEm0+2iW4vLo8/7VH14httpZfCh28GZw6J3hUdgQe+/8OdwlKsXmd2bss6DorWXWvKc1QrwcFLLz20Dip9l6b6tMQQjflZKebvijq3ye2fpD9Lb7VEDMVMlTXKKNA/BmUKYaPDtu2XSebIbhoWi3xnweyHi/gimvjYSH1hLNk5D1T2rmMsuVNk4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d11acb-c3c8-4183-47a4-08d6a981964d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2019 20:05:36.1289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 1/1] riscv: plic: Set msi_nonbroken as true
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
X-List-Received-Date: Fri, 15 Mar 2019 20:17:15 -0000

Set msi_nonbroken as true for the PLIC.

According to the comment located here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/pci/msi.c;h=3D47d2b0f33c=
664533b8dbd5cb17faa8e6a01afe1f;hb=3DHEAD#l38
the msi_nonbroken variable should be set to true even if they don't
support MSI. In this case that is what we are doing as we don't support
MSI.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
This should allow working pcie-root-ports in QEMU and allow libvirt
to start using PCIe by default for RISC-V guests.

hw/riscv/sifive_plic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index d12ec3fc9a..4b0537c912 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msi.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/sifive_plic.h"
=20
@@ -443,6 +444,8 @@ static void sifive_plic_realize(DeviceState *dev, Error=
 **errp)
     plic->enable =3D g_new0(uint32_t, plic->bitfield_words * plic->num_add=
rs);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
+
+    msi_nonbroken =3D true;
 }
=20
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
--=20
2.21.0


