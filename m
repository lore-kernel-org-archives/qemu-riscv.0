Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXbCN-0000q3-9Q
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 19:19:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbCK-0000o0-TC
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:19:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbCH-00042V-3q
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:19:20 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47815)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbC6-0003Sk-2k; Thu, 13 Dec 2018 19:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544746745; x=1576282745;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=l0iDJxT5Nato+uVZXDGQZ6GbczeYSu3+iA97z+C2jQI=;
	b=KIft+qkCuslyDxyXV5nfAQjp+EId7NXgCPBMbs+XOyduVNsYDoD1iot+
	GKnpm/y+RrTUREuD1QmSQYQthWHOVH59gzatGtDMs/PhZ7UHfUheUR1Pw
	7/nEtZ18aSaE0PTSieo41ORH/S1cn17sUHausYRpE24wtRgCaGNhvV5AX
	/K8JeZGJh6brn+BL4ioThKk37FQZENFsw+zen22kzE8ET7+jrYcsAnpnu
	zp3MCaatOv9u8XaACjZsXPYgAetQokM7stGBsO/W8l4eiwMi8YPMSBvzs
	P1+hCtkV9yTbEU4YbqxFwI2R5pTX0hj8rD1cTtuus/1Azl+ScO0QxIlw3 A==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="101454305"
Received: from mail-by2nam05lp2055.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.55])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 08:19:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3B/bds40JPjAOBVCxsB3UWIjkgnlSq0suq865xBsL5g=;
	b=Wb38dwKZHKkbn/Fb3SzeTQD4VSvwKnVpqFDwaN3u1ulDmDIiiZuO1o+VVpbEogNYruwlzFAuah9Y7ff6G4uq46kLxWH59Ol+BVT99a7KyxCuFEpBPyBFrWNPTIFKXVStskxsEjlrOTnLPZmirOLHm6yo6clpx/HJwJp9QeYvi8E=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0497.namprd04.prod.outlook.com (10.173.49.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.27; Fri, 14 Dec 2018 00:19:03 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Fri, 14 Dec 2018 00:19:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 4/5] RISC-V: Enable second UART on sifive_e and
	sifive_u
Thread-Index: AQHUk0KeyqEGU1N5LU6fnoqQAQ+F/Q==
Date: Fri, 14 Dec 2018 00:19:03 +0000
Message-ID: <cac7c30e993d969f89b001d6cb88829c1f6c0073.1544746653.git.alistair.francis@wdc.com>
References: <cover.1544746653.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544746653.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0090.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::31) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0497;
	6:eVX2qY4PBN2JA9xWE3XoAugXzIA2p+U3D0a17Z/FBluEpbFyfmnthvCgUdu5xrw37ZOTpO5uyB38BohjK17oyKRVYDVmtFTlrdOf2JAnd0YIZczj6UXWrhZdGWdZ7yalfNlUViUspRXuD7uhENUZWjaHv0ZOjGs+S1cidxk1U0I60yRyZAXjLyYUTaVeMB9Ns6w12VyjJMpYT2u+k1+SCc9JIWL5aqSVKXeEaBXm8D/ErJ/sbx1BkrbJzI6MU8jlkNKDJfMMUhWP1BrUPj5Kqb14YOc4ttsK/FuLcZw3HVJSZ02gydFqjHpizd2yFOFajnq55e8Pu0oOP83WOUjKMnQG9eQ7CZ/9YwQmFxcorG517aCi7iGXtoKQ/xujA/08Jcru3sSIDitJjqzBKdRlZLvaxMLTzsTokTDj5SwhU0jX9BT5yTH4kATtXElpg6Q1wyuCtybvz9UTcK5N9TWz2Q==;
	5:R8wY91HKZrU/r2AEoC5oBClJA8f1CYzwKfQhRmK7pOD/Hh972i9p052HJbBonD1pOjFhsmx7Z6n3Kb2QqOSxRw5RdaEwaBg2QBC1u8egN1Y1X4biGREIOAtVwdZopE+a5ltU1S5C3CzxbshIMdfdcnLj6gPQzKjXftDH6ZjAgz4=;
	7:C7QhWVytw+qpbycTnIArcDID5f9gPHSoIJb0hkg1f5mPCIbY7IsTwS7Np5MRPoRyGpHhZNozhyE3HBRxNjU63CnbghqN7LXI0k8Ub1n2RQJCV31n5VpOs8T7wsK6MdbNENXx9iqtu6EDLc2O71XQBQ==
x-ms-office365-filtering-correlation-id: 2134f62c-7785-463a-7e47-08d66159c0cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0497; 
x-ms-traffictypediagnostic: MWHPR04MB0497:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0497F1389D5BF1AC403D470990A10@MWHPR04MB0497.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0497; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0497; 
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39850400004)(199004)(189003)(50226002)(106356001)(3846002)(81166006)(11346002)(5660300001)(81156014)(68736007)(8936002)(71190400001)(36756003)(71200400001)(105586002)(8676002)(14444005)(7736002)(256004)(2906002)(6436002)(72206003)(6486002)(478600001)(102836004)(53936002)(14454004)(305945005)(25786009)(6512007)(4326008)(476003)(52116002)(316002)(118296001)(54906003)(97736004)(66066001)(39060400002)(486006)(2616005)(2501003)(44832011)(6116002)(386003)(76176011)(6506007)(186003)(86362001)(110136005)(26005)(446003)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0497;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 9zdMl/oI0GpSSxiTaonxXJxrm4lBk3zf5Qusd4DKkM+4FYp/7mcIFeDenrsxmMyQxBjHZAZ5YqUrDy5upRvD9pAUkVUjLY1ISYUx+otLrYloEGKi7gGQmIUGM3ifYDFueBUqAGVzYWuXiNONlp7RIpTmUkRRWwjvkMDBaVhu6f6Vsttrzk/pbZkSPTjv3YVcdRmsrc0L72uXyswsgiL0Ko934y2HbsOZB71zVXw5EEkZB/8OztoRJV+y0xacYTXePFZpphDs54pr0bZSfUF1YFYVME92BcYWo+o7/yKSQlc8ThKx7AulIpGy8QR2iL6c
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134f62c-7785-463a-7e47-08d66159c0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 00:19:03.7083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0497
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 4/5] RISC-V: Enable second UART on sifive_e
 and sifive_u
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
X-List-Received-Date: Fri, 14 Dec 2018 00:19:22 -0000

From: Michael Clark <mjc@sifive.com>

Previously the second UARTs on the sifive_e and sifive_u machines
where disabled due to check-qtest-riscv32 and check-qtest-riscv64
failures. Recent changes in the QEMU core serial code have
resolved these failures so the second UARTs can be instantiated.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c | 5 ++---
 hw/riscv/sifive_u.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index cb513cc3bb..5d9d65ff29 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -192,9 +192,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_E_QSPI0].base, memmap[SIFIVE_E_QSPI0].size);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.pwm0",
         memmap[SIFIVE_E_PWM0].base, memmap[SIFIVE_E_PWM0].size);
-    /* sifive_uart_create(sys_mem, memmap[SIFIVE_E_UART1].base,
-        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic),
-                                       SIFIVE_E_UART1_IRQ)); */
+    sifive_uart_create(sys_mem, memmap[SIFIVE_E_UART1].base,
+        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART1_IRQ=
));
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.qspi1",
         memmap[SIFIVE_E_QSPI1].base, memmap[SIFIVE_E_QSPI1].size);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.pwm1",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df2442..3591898011 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -350,9 +350,8 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev=
, Error **errp)
         memmap[SIFIVE_U_PLIC].size);
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ=
));
-    /* sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
-        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic),
-                                       SIFIVE_U_UART1_IRQ)); */
+    sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
+        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ=
));
     sifive_clint_create(memmap[SIFIVE_U_CLINT].base,
         memmap[SIFIVE_U_CLINT].size, smp_cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
--=20
2.19.1


