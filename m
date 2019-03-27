Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Dh7-0002uw-JO
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 14:54:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9Dh4-0002Jx-Rc
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9De5-0004oD-I3
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:51:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9De3-0004kx-P0; Wed, 27 Mar 2019 14:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553712687; x=1585248687;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=/9U1pzkyGr1lgCA7dMr6CEVrUA4hNLjSgGzFqb3FPGE=;
	b=iTZnMZobAsBc2MllU+eHwjITJY5U1dgesrZQWES2itT45SDgQr1G2eGf
	8EvXaxb0u9gMSgTS6OoGJaNEnM5vpC5FXLPw1vU4rjRTTRhBdxxhGQn5T
	3hPSsEEg3rsadFBg/BZOCy7zcw0Yy2jHH42+belIbWAwbH3VcwsUb3sSM
	uCA8Bib3b4zakcW98zJzpxoTVU7MfhpIDqcWrXhIz2/vwTnhOdMFuJvH8
	X7n+uVpr1DIBPXZ+pWpSTUW5mhGDmXuQc5QisS9zc4/UIKbbREE9fVggw
	FMM+xvl0pzYp6b35q8g+48G+JiAsfyw9PQocTq21IqyoqCkbs62wQkRjZ g==;
X-IronPort-AV: E=Sophos;i="5.60,277,1549900800"; d="scan'208";a="105752008"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
	by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2019 02:51:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=USiKU+GrhSVOXojNvxcz48N//UGATfPfQL5Me/ndmXo=;
	b=ixzW5/F1eupAs5LP11GthVPbMoNu7ikrCesFMt3Mq6XbM23RS5xibxr1577OTYN3p+kU3BlWWG5A6xcT8akpOk29QPJoe8mdKp8DaRA2cMfCxlJCykivFnQvxOoEWNWT/7SUAZEfpGjiae3VDZ1mfbOUOFmvlBlN4Ek+diRa7zA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4821.namprd04.prod.outlook.com (52.135.240.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Wed, 27 Mar 2019 18:51:24 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 27 Mar 2019 18:51:24 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v2 1/2] riscv: plic: Fix incorrect irq calculation
Thread-Index: AQHU5M4TzNmMPOS+9UOAkUsoTkIkSQ==
Date: Wed, 27 Mar 2019 18:51:24 +0000
Message-ID: <d8953e1be73adb22856fd99ae3807894d4c11ee4.1553712571.git.alistair.francis@wdc.com>
References: <cover.1553712571.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553712571.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44)
	To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5480b4b-1d74-47e5-583d-08d6b2e53627
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4821; 
x-ms-traffictypediagnostic: BYAPR04MB4821:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4821D70657923E14F6CDECD990580@BYAPR04MB4821.namprd04.prod.outlook.com>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(186003)(486006)(4326008)(53936002)(106356001)(7736002)(105586002)(50226002)(446003)(3846002)(68736007)(110136005)(2906002)(44832011)(476003)(2616005)(118296001)(81166006)(8936002)(316002)(11346002)(54906003)(8676002)(6116002)(66066001)(97736004)(25786009)(81156014)(99286004)(5660300002)(26005)(478600001)(14454004)(86362001)(72206003)(14444005)(52116002)(6512007)(386003)(102836004)(36756003)(71200400001)(71190400001)(305945005)(6486002)(6436002)(6506007)(2501003)(256004)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4821;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pGUB528bRStK2haNH7naX6MluKzyU4iGaapKEBvDU9i37kRLKyh80Ud5Ueia49zjlD+nYaTUfSAiaq3DfX+bqEDVuyAwgdWlDVCtmxe4t6LXzralbVPh2Ec1lEligEDokzWatU7z53dO1DBBzCXEZ1e87cnXeq61Fm6LhbSFKUNjjApdpu9Tb+0wf8x6agWjT7qfOclwxwPdOh9vCEoyGJJk3oOu3oESzcBt2b+OZmSmdcBHK2BRW2K1EHpKD5uBuHQGYybnIg3VvQ1bax9W7lCRR1vWpeDdvkGg9hRfqBI/C3qhgfCdOIXA9KVTd2jSokeUg+hO6VeDLnUGeAKr7z2rzDxI9PED+bC0mIFCG0ONR+1fFgHlOvwxk+uLwq9F41QOuIwA7Ov7ZIDh7APTtwdtT6dBX2Oju9y6tSRMI90=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5480b4b-1d74-47e5-583d-08d6b2e53627
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 18:51:24.8699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4821
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.0 v2 1/2] riscv: plic: Fix incorrect irq
 calculation
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
X-List-Received-Date: Wed, 27 Mar 2019 18:54:36 -0000

This patch fixes four different things, to maintain bisectability they
have been merged into a single patch. The following fixes are below:

sifive_plic: Fix incorrect irq calculation
The irq is incorrectly calculated to be off by one. It has worked in the
past as the priority_base offset has also been set incorrectly. We are
about to fix the priority_base offset so first first the irq
calculation.

sifive_u: Fix PLIC priority base offset and numbering
According to the FU540 manual the PLIC source priority address starts at
an offset of 0x04 and not 0x00. The same manual also specifies that the
PLIC only has 53 source priorities. Fix these two incorrect header
files.

We also need to over extend the plic_gpios[] array as the PLIC sources
count from 1 and not 0.

riscv: sifive_e: Fix PLIC priority base offset
According to the FE31 manual the PLIC source priority address starts at
an offset of 0x04 and not 0x00.

riscv: virt: Fix PLIC priority base offset
Update the virt offsets based on the newly updated SiFive U and SiFive E
offsets.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c      | 4 ++--
 hw/riscv/sifive_u.c         | 2 +-
 include/hw/riscv/sifive_e.h | 2 +-
 include/hw/riscv/sifive_u.h | 4 ++--
 include/hw/riscv/virt.h     | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 1c703e1a37..70a85cd075 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr a=
ddr, unsigned size)
     if (addr >=3D plic->priority_base && /* 4 bytes per source */
         addr < plic->priority_base + (plic->num_sources << 2))
     {
-        uint32_t irq =3D (addr - plic->priority_base) >> 2;
+        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: read priority: irq=3D%d priority=3D%d\n",
                 irq, plic->source_priority[irq]);
@@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr=
, uint64_t value,
     if (addr >=3D plic->priority_base && /* 4 bytes per source */
         addr < plic->priority_base + (plic->num_sources << 2))
     {
-        uint32_t irq =3D (addr - plic->priority_base) >> 2;
+        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
         plic->source_priority[irq] =3D value & 7;
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: write priority: irq=3D%d priority=3D%d\n",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ecc47cea3..88381a7507 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -340,7 +340,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev=
, Error **errp)
     const struct MemmapEntry *memmap =3D sifive_u_memmap;
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
-    qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
+    qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES + 1];
     int i;
     Error *err =3D NULL;
     NICInfo *nd =3D &nd_table[0];
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 7b6d8aed96..f715f8606f 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -70,7 +70,7 @@ enum {
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
 #define SIFIVE_E_PLIC_NUM_SOURCES 127
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x0
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index be13cc1304..d859ea20f6 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -68,9 +68,9 @@ enum {
 };
=20
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
-#define SIFIVE_U_PLIC_NUM_SOURCES 127
+#define SIFIVE_U_PLIC_NUM_SOURCES 53
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_U_PLIC_PRIORITY_BASE 0x0
+#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index f12deaebd6..568764b570 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,7 +59,7 @@ enum {
 #define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
-#define VIRT_PLIC_PRIORITY_BASE 0x0
+#define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
--=20
2.21.0


