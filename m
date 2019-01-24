Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmix3-0003IG-N3
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 12:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=920fe819b=Alistair.Francis@wdc.com>)
	id 1gmix1-0003Gf-Qp
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 12:38:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=920fe819b=Alistair.Francis@wdc.com>)
	id 1gmix0-00026g-Tb
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 12:38:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=920fe819b=Alistair.Francis@wdc.com>)
	id 1gmiwt-0001yc-8F; Thu, 24 Jan 2019 12:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1548351492; x=1579887492;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=PH82n6TTK6X60uLT5PuHxSh1X7VuzLooy1bk4u9bDZs=;
	b=QiDTK9JVpa+m7836+dArLo17UHGfjJ6DBNVcaCNxdw0Mo7xeA/eX8u0M
	2A7062tpWqEzSFc5y2mDRfC08V84eexfq1oHLfxjFcUa2hXsGNfukUr6Y
	dfhU/P15My2rN3BosJ0mxAfWv/Etj1tniKfa47mk+b0pgBLrEqkTZF6U3
	KuOpQzMZ9lKqZBujB3AvQ/qVkVO5OTfNWyasd3CruIW8D8qajq/fNnpgW
	GJkOTpi0wSVuRNrVsZ/NB/n6ruQ/nCZ0Kr4Z4JwFDG2NwWFX/ZFJvYFwO
	988xHJK4kS5zJfzEiZo/N1IU8Gi7+5k4KnZqFeLj8QIJr4c39kpbgykJ7 Q==;
X-IronPort-AV: E=Sophos;i="5.56,517,1539619200"; d="scan'208";a="197792209"
Received: from mail-bn3nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.50])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jan 2019 01:38:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kXdCWqD3JjG3q1YDXUbwzTC0fcoEeHGx4jPD8ZGU3t4=;
	b=LxJLnTaBxE7MOoYnDELKRzwwEQKfGjGozMFYGSFlb3MbjYEw1vIM2V86nXNYcRhMwVUJuFOT1rsLJ5WceI1VNmvXggqWwwj7pX/ws5+3rh3kOe2avjl7ruWriwRmjCnFh64rwYNMSNB7dALX6fogzKLwqJjEyID/91HAiMlDAbs=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0640.namprd04.prod.outlook.com (10.172.166.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.17; Thu, 24 Jan 2019 17:37:48 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1537.032;
	Thu, 24 Jan 2019 17:37:47 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v3 1/1] riscv: Ensure the kernel start address is
	correctly cast
Thread-Index: AQHUtAuFvY3s2bsGq0ON1FdcVa6VyQ==
Date: Thu, 24 Jan 2019 17:37:47 +0000
Message-ID: <2b9ba958f8b317df83c37b348ad543fef2113528.1548351450.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: CO1PR15CA0065.namprd15.prod.outlook.com
	(2603:10b6:101:1f::33) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0640;
	6:qrZq6A/DxrsDbT7GbLKn1t92LuckhtcuX2HE6aCiBgbYEiZcrJiqV/LNjW5jyUPsVLqxjowYiqvivPNrEsrTE1l2LKiduhGsjmQ/jIkFWrwSNzKJMHbHRmJo2Cs8OsJUnFE1+fZdrj3mG9aCNeKDk20zO8yw9guVc28ZaevDhS95p9lJnOvT9XVKj4F0kQ+FDfI/JVZXJYmgVVaMZbnfFXAovSkXIH5lAnXOpCgj9WHxfaUJWgO7Nw74a9s3Zq92l6mQpMt/HAQpLM1OwP8EYLyULxeTELBsMknQWVGjY8t+IO/y1QCr3izU6WJNC08cWa8rxtw/BBxLduwuTV4NCdLOBLb2s/X1WSXikdIysHVU/65UGS+6iGGziExGvhxkwZ4xgtKWaG6ZbZc2SEWuePLT0T0THPcXymt6P/HE/Ap88q/HCcYdo+n14jU9p+CXqgqrVomGna5Nk0jcaOUj1g==;
	5:g6HFOWJSlXZ6gQ80DiE9Pzox8R1TNCZvLW7cogS6jtECcb7w3W6RPIPAmGYbbfvFW+JeI0W0n7dYDKs7BZ0qcT2s4l0X+8BqFCokqa0BRcUPRG895CfKZsg3F/NMYRGyXVjkJ8GV9+bOLHBhyG8XoWt9JzPIVHf75sd+L1LXHB5TaFIDTIzVRoR6Gmwi4RBLft01rNHXFrwxEfPEpFAGWQ==;
	7:UaxXkJVmybGqPTNH9dfpxp1wN86FRlZ7nMVEUWLkxS75ezeiTyb2cEVyetnchIjaRvK2HQk5XlTUSIcUKXZb7h/LGpUd8f/JPx94hnqB2YzEyt1R1mtA0FQugcbOKcCVnIXlWdxlC9Y7A5ouiRmgVw==
x-ms-office365-filtering-correlation-id: b65ef03c-1711-46e2-7f25-08d68222a78d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0640; 
x-ms-traffictypediagnostic: MWHPR04MB0640:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06405E87381E66A812B65944909A0@MWHPR04MB0640.namprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39860400002)(189003)(199004)(36756003)(6116002)(2906002)(25786009)(106356001)(3846002)(105586002)(53936002)(118296001)(97736004)(6486002)(72206003)(478600001)(6436002)(6512007)(8936002)(14454004)(50226002)(256004)(2501003)(4326008)(39060400002)(110136005)(54906003)(81166006)(99286004)(86362001)(2616005)(476003)(44832011)(8676002)(71200400001)(81156014)(71190400001)(68736007)(486006)(102836004)(52116002)(66066001)(6506007)(386003)(186003)(316002)(305945005)(7736002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0640;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yFEi9fd7ydD8uW9CcAG51eibhvC5QT/OQA8r21lv2OaJpsa9gS8OOMDZ0nTVZFyhaV4aFLhVZmsXbznTqMklF3CqWL9DzG2v44z231ry1kUF/0Ek8YjX1RnRbdXS5x2fs8t8GayHBr8LdHMTy63ovUfhb5eLA+IN2Pu/pfeJmAoCN2rZjJtv6mcvFY+jDpx7P5PPpVocYw+ICaVy5bX0PA7/pm4LWu44sApmc9kni2lrC6BCzV/zhl5g1IvIe6EhEjAcDcuRNA+5uve1I+5qbWvINjw2nKXT+DDGa1lSc33K69Wsp5Qu7brMP1T7Ub+mOwK1ZBNwzlQxVR3KlAyRPvg4o241V3UIOYNSXdY4f6A5VpVF7zZU8aSaf/HGghAHjBGw8ucAgsH7s5tybLylhSN2l71BHxXj/+ZTKULmXUo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65ef03c-1711-46e2-7f25-08d68222a78d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 17:37:46.9579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0640
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v3 1/1] riscv: Ensure the kernel start address
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
X-List-Received-Date: Thu, 24 Jan 2019 17:38:04 -0000

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


