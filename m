Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi7vU-0002Tu-BI
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jan 2019 20:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=90839a9a6=Alistair.Francis@wdc.com>)
	id 1gi7vR-0002Tm-Uf
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 20:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=90839a9a6=Alistair.Francis@wdc.com>)
	id 1gi7vP-0007xI-IJ
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 20:17:25 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:49892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=90839a9a6=Alistair.Francis@wdc.com>)
	id 1gi7vN-0007tT-SY; Fri, 11 Jan 2019 20:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547255842; x=1578791842;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=uSEP2sqdnz5uJWX5bTuMBe9WuJPzpp5iP9+7tAyY3+M=;
	b=br8b1iE0HLmv7VVOmtM/EeWqW61S0VQV9Vwm1RO1ObPHIQOflm0x64dP
	NcsFYIm7UFfYCDcn5t7nT2I8z0p0q5zy2hLwRCXEjY1xjYzVdEfP4tgl2
	oPo9ZdZC23PP7Mk4u9qS84/eSFjadvMn+n7OdvLkwPHer7W4xRfMym8tX
	cI1YH9UguNWTAO709JIQDnXFhPj/vhPU7lDGl6VEx8WGyBl4Z+4p+K6uE
	pc3G9rMlBIgF5FeD/ejpEKStzwxJ9COZCOrHOVhCjldp9Z/IoklG2ae3J
	oHzBN9QH/vFOqPYWvMOn6Ggs68E9BZBOnjB3/sa4NF7yr9a+Ifh+WqjxX w==;
X-IronPort-AV: E=Sophos;i="5.56,467,1539619200"; d="scan'208";a="99824624"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
	by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2019 09:17:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zHJXnMCjbPutV8E/BdJKlSlvHyCwJxCxGzEB6FA39A4=;
	b=T0vVkwhx1pWmQqhLYRvyvsN3MjiM1Zmyk+JhDgAn9nv9CAaU/ki8YzFOK6xmsMvKF0bgYg0A4jPlkIjIxPhpmc2Wo3NgpEAwp52v2nz7FfmlCbcJ90kXgQos0WTxATOqjZlrIRj13qAFuFkP6k8i13jE6TyZ0H3dJpUxCAoBUyY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1041.namprd04.prod.outlook.com (10.174.250.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Sat, 12 Jan 2019 01:17:09 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016;
	Sat, 12 Jan 2019 01:17:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "agraf@suse.de" <agraf@suse.de>
Thread-Topic: [PATCH v2 1/1] riscv: Ensure the kernel start address is
	correctly cast
Thread-Index: AQHUqhSKDYa/PTZzL0G8L3Kdu1TErQ==
Date: Sat, 12 Jan 2019 01:17:09 +0000
Message-ID: <d2ae859d3d73ec1897d78131e05a6cf6ba6c94b0.1547255794.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0024.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::37) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1041;
	6:uyziNzx/RN/96t3MkZipye4FP98V2IgcOSG3j9sP8dUwqXc/JB2aRKd7lVhKIbY+xobEKkvj3XH32IXLZnjxjklOv5qin47F5smNoX6tscye/f2rWu592Bu+yB/8wqOcSyVGS2l2hX5PJaRM233ukNuBn76pl9BWPONybRRaLbnAcTDVqiQ5DmeRbKIPMlTi6ZD8kiaU13agUlap1YppwKLJtIdIebDNOlh86Z80uBbQ7um1fL30cC8THqU1HjgubfifGslGN1KXxUTgd5GvgeechkXuIij80GJRG3TvvB6gcgfbI1AKoFb7weGTjqSfiCKCFk5DiUPfhxojchnYIoWmSj4Hlmk+sFD/N9hg9YVziPWid/rRxH3wkoXHezE+aewhsKE7KYtZTVC0w8sEBojWqeQ4yMKbzQDGuLdCuDRg+HOwPTSuI+FSWkYpv2vcmtIJtlurVm12QyZC6SzdRA==;
	5:Oeaa9bYJuSZ6ReM0/57DqEY175QSPIiaGmUKIPZQ50ZTeKzE25SoZv1dDuy5uighbDNiD0aOvitzA8Hg8LzopdcJZ7xyjY3M8k6PBAYsieJV0NlpXrAhU1nsoS5nyGjYIgksxvqRU9P5ZK1r2kLtyjb4bytNCL/lcR6cR5HIhW2jhwdkFkkYLckM8SP9OsOoPLJh2tiM3adgPKgBTIy2bw==;
	7:Xm8MR3BUaTuSCTgwBdiwZmscp4W5UBVxy0ov8FVp/g4SSG8wccisPsQyx7WzJuJhParXXaPAqR38fF6MnOUMEfjbs8X6MnvTSj0NxlgzHw45xl5HFSAer7bZVap/ndoeoXygsEabB/Ci/6iE1oERRw==
x-ms-office365-filtering-correlation-id: b65410b2-d7c5-4bb2-30b1-08d6782bac8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1041; 
x-ms-traffictypediagnostic: MWHPR04MB1041:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1041270FE48CCC2B4F740E9790860@MWHPR04MB1041.namprd04.prod.outlook.com>
x-forefront-prvs: 0915875B28
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39860400002)(376002)(366004)(396003)(199004)(189003)(26005)(256004)(6486002)(6116002)(44832011)(81156014)(3846002)(476003)(486006)(81166006)(68736007)(7736002)(2616005)(316002)(39060400002)(110136005)(52116002)(8676002)(8936002)(305945005)(71190400001)(71200400001)(6512007)(53936002)(50226002)(2906002)(5660300001)(6436002)(36756003)(86362001)(66066001)(105586002)(72206003)(478600001)(14454004)(97736004)(54906003)(6506007)(386003)(102836004)(4326008)(106356001)(25786009)(99286004)(118296001)(2501003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1041;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZG7Uu2w8JAnrEZOcV9UFdK9MjDzqQFh0XAnkDe7vbJGJOv6EoRUWTuKq7v7tAzv6d0iYb84ZAArGK0UQAK2Dhd0bDTQVnrdm5tHjKrGzwUo1tTpFyrLnAcWKHQcD/Er6qtQj5IN01f0kv24NAj3EqdLlNv7dYB1+DQdwQN1UlG62xPpuzf8l/7F+917bi3ZfOmwei+ROKHsyugi6fbp8TcJd4zGMIk4/wg/AS9VhG6qUS453PDcU+2z6wLwr6s7FaWFHnN3ZXzVafgF9H+5M4v9UVMIs5UdCtRxlJHc3QIauP4qJP2lUkIFHGti8lDDuhB8zXU7qBkhFSnkiLXHYwSGrgIVeOB08sbfepXE5JvzL6UvitiowQAjKO32FDOCW3kDaCyWaPtgE0fKJGchwtWzQqQtO+Kg2S1P4IceMJOA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65410b2-d7c5-4bb2-30b1-08d6782bac8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2019 01:17:09.7038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1041
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 1/1] riscv: Ensure the kernel start address
 is correctly cast
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
X-List-Received-Date: Sat, 12 Jan 2019 01:17:26 -0000

Cast the kernel start address to the target bit length.

This ensures that we calculate the initrd offset to a valid address for
the architecture.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Alexander Graf <agraf@suse.de>
Reported-by: Alexander Graf <agraf@suse.de>
---
v2:
 - Remove old comment
 hw/riscv/sifive_e.c | 2 +-
 hw/riscv/sifive_u.c | 2 +-
 hw/riscv/spike.c    | 2 +-
 hw/riscv/virt.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 5d9d65ff29..e5d7fc548e 100644
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
index 3bd3b67507..3b3acec377 100644
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
index 268df04c3c..79cb4c1282 100644
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
index e7f0716fb6..648462b18c 100644
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
2.19.1


