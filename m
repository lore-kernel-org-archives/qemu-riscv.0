Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRnnv-00068I-0z
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 19:34:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=863bfe0f3=Alistair.Francis@wdc.com>)
	id 1gRnns-00065i-3U
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 19:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=863bfe0f3=Alistair.Francis@wdc.com>)
	id 1gRnno-000197-Od
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 19:34:07 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:35350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=863bfe0f3=Alistair.Francis@wdc.com>)
	id 1gRnno-00017n-Bb; Tue, 27 Nov 2018 19:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543365244; x=1574901244;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=WCxmBLMVhSjKDDC6sFrVyJp8eOLouck6ZJASeVLSblE=;
	b=ohO+R2I4rKE3EAmORd8BEuFLbry9EpB1Mhz6D44IKpMVcjSs/7sgLdyo
	kTSM/DHJFOv8oVEgyhmwWzfRuHz4Q9KNlw/sL1XZvdX/zOdPLrNm3LWPX
	zTBxuOmnFgMhG5tk3MdZSfQZ6WtaBEcEUwsKCXoH7f6WiJSQUutp8eQji
	yh9612M3sqxDfzfziyWWhsqzOmzSmNm8Roa+tzVPJndx0+n2lrFJD40Yt
	Mcs4oEzKL3yyJVI+bjCaIZNDG7Wyvt1CjojwN7cfEYWHZokpBxfVe0e9N
	Ap842yVwwI4J0kt9xY3eYd3Wgam0jA2o0tNYhgblAcSizXfCkKCe0ewnM Q==;
X-IronPort-AV: E=Sophos;i="5.56,288,1539619200"; d="scan'208";a="96446788"
Received: from mail-sn1nam02lp0016.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.16])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 08:34:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BzPcoDG+h8X/LAfh6l6CPSZBKiGovFJdctYlfOOnKMg=;
	b=cwu6Fy0LBrychQ7Z6IFRtGZH7JNwbxrD9sF2gPo6ELgH6rSEQ0mAJ/TLHQFYQY4U3qWpdwyTUiMNoTw4UQ7F7L+9TdS6Z/JrUg4OI59SaqCp3xvP9f+Oxq8sWtHxJ9NttrtHy0nnSGcn2+74LrF8A4kmPsbAsSnB/c/ExiJIZP8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1104.namprd04.prod.outlook.com (10.174.250.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Wed, 28 Nov 2018 00:33:59 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Wed, 28 Nov 2018 00:33:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "agraf@suse.de" <agraf@suse.de>
Thread-Topic: [PATCH v1 1/1] riscv: Ensure the kernel start address is
	correctly cast
Thread-Index: AQHUhrINdsGEZPVk4EaV1sAseoYMpg==
Date: Wed, 28 Nov 2018 00:33:59 +0000
Message-ID: <e351b95659a0fc50d6f7122552f41d38987bbe86.1543365187.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0007.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::20) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1104;
	6:vANa3kDapjsv/N+bB7FKYZbBPFCPV/GLRycv7N+/npAFj884doPOYNVZ7CI2GLV+6L1OZshm9d+J1ZZlY9UUyoDE8obkgY/Qk261Ei2NnOOufWwdnCXQ0mxw53kwSZRPzLWs04p8s07Cv1zohp89wINI5JfIh8NzQ7VWi+VYafXtea3kKWYfRmDkfHlCX5ViNWJIoT114uHI10R/rD88ltRP/verBCm2ixlXWhSw+QeeyVAop52BPUfNMi6z04G78eRj0Nsrm/t7RbOLc6mUp819bIz1HsCejvCME3RceVk2FNIBA4l3GPb1ucgJbkvwkxI7FwNw9zXwoItbwTCvXhkOuq0aHVkKReWvQ5p6w4QI3N0JxkCKyoe6W0AY1n/ixCoWsWCtPRCFCSYzIjeeT6PO8l9961CiiOeokfA1dYITvdt9kpGSAcn7oZfckU3rzU8ro/4AETCgDk8Hndmg0A==;
	5:sq637iZ7Z1fUQ3sWGs5K3oZFNdkZMHuWkvRjPKSBFjlgjzXGQl4noHXLpVNcwrGSb6IIlCScyjRCGkrboWJGthcByz7e932pshUqwd5xdb2BtuH05C3VJHty//HVPVydhhEuDck/cAcJeLPakyKnsK1g6IhGIm5LatQHk49oIfY=;
	7:npUq134TcixjewFSHOtDFP6cl8pN1U2KKmiG1bpHuCutQiqvLrmPU3BrqPotZIy8J5iA0FIz6V80UtArn4k9ySO1UALOeugTM7F9h9o3VuMS86+lT1iGrw5NEnW/kf6RKCtcQhzRddy8PA13At5suw==
x-ms-office365-filtering-correlation-id: d7b0fde7-573f-48db-744e-08d654c93034
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1104; 
x-ms-traffictypediagnostic: MWHPR04MB1104:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB11040DDD2B7230A4711134D790D10@MWHPR04MB1104.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1104; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1104; 
x-forefront-prvs: 0870212862
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(6506007)(52116002)(8936002)(386003)(86362001)(3846002)(6116002)(44832011)(2501003)(106356001)(26005)(5660300001)(486006)(305945005)(99286004)(2616005)(102836004)(105586002)(7736002)(6436002)(36756003)(476003)(6512007)(25786009)(66066001)(14454004)(71190400001)(72206003)(97736004)(68736007)(81156014)(81166006)(4326008)(71200400001)(39060400002)(54906003)(50226002)(316002)(118296001)(186003)(6486002)(8676002)(478600001)(256004)(110136005)(2906002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1104;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 6y1EFIhUJrrKsoPOnvC9WNBz040CKJj9zyX4oHdepw3yplpBSg0jwag7hJjBPR7DT4Nf7m0Wf+AaFw37lZi1YLepy207tyfBREd5GsGrMQNJ1MZnUvyExzXAs885S6hrQqEYPu5a87Uuz0/lLvqSQHNhK54K//kdSlKgCt8U9WHbljIAwBijEVcIrJPpa8cT8ddH4zfHryCNhldLu5jKzR5iJlBLHQSBirHRur0+6TzCfXBbx2MDGiDrzMuO0Y5hDBR9tFcaH1yrFHtNtlpzlVbNlNHMT41xD+lSOauGpHQlqxzLqJPPsKnPxWXbU16ytZUyev1fWSMf+0/ikCAkS7MxVL0eglaffsw4sOVMek4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b0fde7-573f-48db-744e-08d654c93034
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2018 00:33:59.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1104
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 1/1] riscv: Ensure the kernel start address
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
X-List-Received-Date: Wed, 28 Nov 2018 00:34:09 -0000

Cast the kernel start address to the target bit length.

This ensures that we calculate the initrd offset to a valid address for
the architecture.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Alexander Graf <agraf@suse.de>
Reported-by: Alexander Graf <agraf@suse.de>
---
 hw/riscv/sifive_e.c | 2 +-
 hw/riscv/sifive_u.c | 2 +-
 hw/riscv/spike.c    | 2 +-
 hw/riscv/virt.c     | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index cb513cc3bb..3427b840cb 100644
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
index ef07df2442..5d03a76a28 100644
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
index 2b38f89070..f4cbf6aa21 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -57,7 +57,7 @@ static const struct MemmapEntry {
     [VIRT_DRAM] =3D     { 0x80000000,        0x0 },
 };
=20
-static uint64_t load_kernel(const char *kernel_filename)
+static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
=20
@@ -85,6 +85,7 @@ static hwaddr load_initrd(const char *filename, uint64_t =
mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
+    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
     *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
=20
     size =3D load_ramdisk(filename, *start, mem_size - *start);
--=20
2.19.1


