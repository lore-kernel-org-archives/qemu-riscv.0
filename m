Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsGzo-00054b-K7
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 19:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzm-00052W-Ak
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzl-000670-Bq
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1225)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzZ-0005td-R6; Fri, 08 Feb 2019 19:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549673978; x=1581209978;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=EJhwCJTuNK0s9NF5ThrN7bFUpo6FybvB83vIEm6flhU=;
	b=TNL19rD+nGZlhMekZ6/w4XXt5F/ZaF/6+xvNEAaZE6NJwAKaG0HhthvG
	4uanqGGP/cVmJXdNdpHPLq0Wbnh5Br1Net0BF4NrofE6ANeS0APq3q0eO
	X7C4Dt92D2lWpJ7N2nt+U7769LqPIHE2JPf29R+GxgPJtvxwNVclEdnDS
	FJ21LXj917r9ZUDvHwyCtjJViKs6VhkcZz5MiiipCsB1Hk+D1JicQHqFh
	RlS9rcoVK3HZcMExXh8UbmXMulzpo3axqiuD4BaBgW+1bd9/SKvEePAq4
	ufq54seSW8yl/s4xm5WjEvY1yVM9bMyiqlTFyOBV9u6MuzzH5MbV5BsDV A==;
X-IronPort-AV: E=Sophos;i="5.58,349,1544457600"; d="scan'208";a="100821362"
Received: from mail-cys01nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.56])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 08:59:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GTTd05JqdcCCbZtMAgDdtM6kwkxp4U5GeWBxOjYfc8E=;
	b=nzpMRjTI+8voP5kb4PX0f+91NQyQneSTIKMayzx9NvLxAkpcavAKq/caLfcnVemM8DpwFTESnE0DL/42Btv+u3AhXnG1VXUijOS1b3qYT3GhDowb+2kq9TiqrrUH1B9YauK6jNoc6RNrYcP+vDeAgpNL99TZKgIoWirIZvDjcQI=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 00:59:29 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 00:59:29 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 01/11] riscv: Ensure the kernel start address is
	correctly cast
Thread-Index: AQHUwBK13STffwFQRkqSN09t206+9w==
Date: Sat, 9 Feb 2019 00:59:29 +0000
Message-ID: <8c6435dc844f00f14437dc1ef185ccd28e5cf0f9.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR04CA0026.namprd04.prod.outlook.com
	(2603:10b6:a03:40::39) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:vv7w4dE047zvikcaNcxJsQi7AuAOZMppiTGDOMW6rAvjMTp3n1o6QTEhNckAPQC866mfbT6fwpDIh6M4RZObsStxVXOGwFybJzOfmXog8akzjOTWU3ZEHttBelYsJbMgOB433SpysfkT0pGXu5q6Ee42IpRMBUZwByNwL2xYmw+2vJYcqHf/GwLOdhOXMyMwPyQaPQhg1ZhZF3T65Hq7NHbAt4AcTJSQ1FK8EFngN1kVeCP8bypaTvUFkCgs+/Fp5ldMvg3milgG9OuiHHAW9I8QxezNydFn3pX1mzq3nzcmJZ3ltfxqvBTgaK/Oeh8odDgrh1vXKD2DwPGqGBtD7TCEHJAoOycJpBmWpo5IKv2Wm94RhgXR70G+6M03QXeBiTHOxa+1bRCsApkn3AVzPusNuKcmou63nyKEEuW4ozRRqd0zcepHiZv5Bz12vdR7wfhlEWoTQ+8MbtXRsuNXjA==;
	5:sESoONy9AfmHSgyVEOr9ah6zxctF8gHUwh2yg36fke421S3k+pHtPHvDxjuBKJqLRVa7e8389OkPmuxpoQPaEOV2VKvvjrVh1nTLgaL0BUd8RH/owM+H/lBL6d+4d0ZlslWHA+ccJ92LsyMPZKpWj47bYEshP2NA/bG+0P58FEWBDcJOo3DWTy2SGsqNDt+aZgKPsYn3IiV3VHcTy1N8zg==;
	7:/IJOoinEl+rtJK9vGe+7ii5KGNU+VdIFYASQXE+US5t79qyv84uKANvvlTABdeLgKuEzsl5Q+ahLSvmYNCwbago1w2N4+YZBA9xbEwUY+aVIF8XJB15do8zRRZ3BM8i5883yJMqIbmq5W26Ucm/XDw==
x-ms-office365-filtering-correlation-id: 92669010-995d-4103-a0eb-08d68e29d800
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409B6B0638C76AB7D5F3827906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N4++IfAbp1x9xUu4b48nStyVloEh8xuW9xIhQbQw1EeO4k+bJX4pciGnB5J9yA2Q/8ZbdIcd0aDUmroqmRSKVF10M6b4l9d/A/1Kgy6alFUE7gKQh/lSFajDn38N5/Zs4ShNWn9U0X9c2TF8zlglDNnj+cgFWL631g91Yn9nkgCcnnYtfOPi1or4g98noK+GfIEGChTEHUTGBHVdfg4tU4s6tWOmKjGkdU9ZFQu8blnA8kWLFMoWuULFpN6krQAggajPgQ6W3EHpe/pIwQ0K6iMv6UkoRgUB+LsyCzvpYWaBXbaDDphVHNStgLJLLj3fqdGisHJelmHKE/ZKf0dZr1n7WCgGnE1cgBLVRudA5JcRcinuJp5cMJ8glDhyxrdsW+voHdBTPVGWA4XIy9N3vZPW1G5prugX1KEWi4cD1/s=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92669010-995d-4103-a0eb-08d68e29d800
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 00:59:28.6255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 01/11] riscv: Ensure the kernel start
 address is correctly cast
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
X-List-Received-Date: Sat, 09 Feb 2019 00:59:51 -0000

Cast the kernel start address to the target bit length.

This ensures that we calculate the initrd offset to a valid address for
the architecture.

Steps to reproduce the original problem (reported by Alex):
  Build U-Boot for the virt machine for riscv32. Then run it with

    $ qemu-system-riscv32 -M virt -kernel u-boot -nographic -initrd <a file=
>

  You can find the initrd address with

    U-Boot# fdt addr $fdtcontroladdr
    U-Boot# fdt ls /chosen

  Then take a peek at that address:

    U-Boot# md.b <addr>

  and you will see that there is nothing there without this patch. The
  reason is that the binary was loaded to a negative address.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Alexander Graf <agraf@suse.de>
Reported-by: Alexander Graf <agraf@suse.de>
---
v3:
 - Add steps to reproduce
v2:
 - Remove old comment
 hw/riscv/sifive_e.c | 2 +-
 hw/riscv/sifive_u.c | 2 +-
 hw/riscv/spike.c    | 2 +-
 hw/riscv/virt.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index bfc086609c..b1cd11363c 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -74,7 +74,7 @@ static const struct MemmapEntry {
     [SIFIVE_E_DTIM] =3D     { 0x80000000,     0x4000 }
 };
=20
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
=20
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2730b25b60..7bc25820fe 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -65,7 +65,7 @@ static const struct MemmapEntry {
=20
 #define GEM_REVISION        0x10070109
=20
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
=20
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c66ffc50cc..2a000a5800 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -53,7 +53,7 @@ static const struct MemmapEntry {
     [SPIKE_DRAM] =3D     { 0x80000000,        0x0 },
 };
=20
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
=20
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e8b19c668..fc4c6b306e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -62,7 +62,7 @@ static const struct MemmapEntry {
     [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
 };
=20
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
=20
--=20
2.20.1


