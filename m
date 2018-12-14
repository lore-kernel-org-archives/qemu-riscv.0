Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXbBt-0000YY-7k
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 19:18:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBr-0000Uk-0B
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBq-0002qv-4s
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:28134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBj-0002YB-Ah; Thu, 13 Dec 2018 19:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544746774; x=1576282774;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=wy1gsWhNMyacTjYO5PUk1751KW5SzxgFqKFa5DzAg3I=;
	b=QG0b3rIbGciJT73HXf6hacIqR2uUKyRtINIrslw6pqXpxPMTD6Cq+3cB
	JgMtqW7l2oYjJv6zch1B7ZZgc2bx1UEdHk5DtJYipnyiF/gtZXpy1mUk9
	3iPjMb9D+pdLLySWTjaJ3DWbKmDVOibpqDxFO+hC97RoWNyuD7qCRwsbB
	ACJTmpmEqgwSc2MhdBb+uDoVD31FrvpNFGOaRQ8z6avAio25vc/OGxjal
	y+y4sew2AJNVUToXeY47NBoCzbnrnmQ/699luo6QMiCwMeGqGod8Hu75S
	HRTm64sIJUPxhOVsAj2BQKX/ZN1MDtjeza8tjzA2uJE4Du7nGLFRY3D0H w==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="194449099"
Received: from mail-bn3nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.59])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 08:19:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dcBICFHbDOZ4O/C91zn+7v0Uw6hhu1/JBCQEFOPEHuI=;
	b=NHFqNq7ibgF+UYzIK+lePvap+tNgw5k2y1YYxHyvp1NUdoO4gyow9z+ZL+/zq5FSz57oq55AjXcAZ8wZbOZMPtm4awmUO+HBVefMMmOcSr0mJi63xg8EJcYgc68RfBworsaCPbGz6WN+IV77MVj9Gdp4wvdGS4TXLji4OqV1scg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0497.namprd04.prod.outlook.com (10.173.49.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.27; Fri, 14 Dec 2018 00:18:39 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Fri, 14 Dec 2018 00:18:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 2/5] RISC-V: Fix CLINT timecmp low 32-bit writes
Thread-Index: AQHUk0KQ5+1obptxXUeurTd0K+nBXA==
Date: Fri, 14 Dec 2018 00:18:39 +0000
Message-ID: <66f87c98f9a2122262d7c3179052df95e42b6917.1544746653.git.alistair.francis@wdc.com>
References: <cover.1544746653.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544746653.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0098.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0497;
	6:DHMzje1i3K7rRNuHiHPLCg9mlPdPcgpD+Y9cDx3awzQELyoOBgwsvzxOUxZI9w1YdDNUeY/KHrX4Y/gNTYxQHkkoovPVuog16TtIpui6eyfaMFrGJnHx2jtjyfD6Lvyt/WtkBk64M0gfyeZs0xJN6etgBsZuIyNoTTddlTHroDRetbXxQTtPTLg2KuCJ8LQ3LULQFCju1yX//YKNLl48UN/T5MrObGxcaeghFNYOturiKTyJn3Cwk1du/4tAkX7VqrmtYXBx7/6SNa5euO06DrLm9bwm4klYcKgF25r42R4eZZ2kaxyYu9URCrEegK32J51P/3UrRRtnDAlUehcKy/hN/A+0TH0BD9P7IUUcD7Wr2b39SqeYrlYfhQ2IqzSZHzgLO2r5BrV04+fG71Z46uYtUFmAA766YdTEk0XRtTevSfiM+UgJfWy7FqyvqYme08bcyTLAbp8lRPb0BLn+1w==;
	5:ctgbatV0/665zggN7oyWwH/+WTYslgLUmS5AiPan5roNOXs6SeyLdwSY5ZMCcczNHRlOF7aj53m6ZQ/Pc8YNmBrVkZF3uf0cpksQk3jiv3USap9KevPqO5RhWAdF86HObQsu2OVSpYJDiMjaM8hUjr05E3ZP32vz2/QG3A582ME=;
	7:dIgU43v+Q6BmBM37Gstb5lEJNwyKTccyunLskEXQbKSJfw4Q0neffw1aEx5067rn0xYBLkXCOQTN5+D155ioKd4AYxogtnF0eP1WKHa8ASLf9g74zfd8OXEcel3UXNXxPP8RgPz5/Fc+FvnHHjMfGg==
x-ms-office365-filtering-correlation-id: 1a146e27-79e0-4d28-429b-08d66159b26b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0497; 
x-ms-traffictypediagnostic: MWHPR04MB0497:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0497FD6DC9120FEC6410B18790A10@MWHPR04MB0497.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: +/KBg4jVU9/SpICX8lQllFd5DGV+DHmO96ePkiGb3TTjDQJDrcBGkqKD6GifZEvBn1ynu/Ze2OXcvZ37mKzJesmDlwVliBq4juYGFEPIoM/MCsfN4hi7AU9sr25NwE1C5dgrldhJDLc/3uaYNN7d5sDG0shrUtl/ke7sPustop9Mynahtx3Nhhk7xCGQlwsv9YECVAZapZGYgek+Hn6WVghiE9NjVUPytSAOd+3R2nH296Sa/rY1qk7snRzxPEKhjVzb8V8F5QAztvm3li7bTSHaK+DzNgco2XIxB4riQ9MP/GTbx++nvREThbyq3/Mz
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a146e27-79e0-4d28-429b-08d66159b26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 00:18:39.4891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0497
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 2/5] RISC-V: Fix CLINT timecmp low 32-bit
 writes
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
X-List-Received-Date: Fri, 14 Dec 2018 00:18:51 -0000

From: Michael Clark <mjc@sifive.com>

A missing shift made updates to the low order bits
of timecmp erroneously copy the old low order bits
into the high order bits of the 64-bit timecmp
register. Add the missing shift and rename timecmp
local variables to timecmp_hi and timecmp_lo.

This bug didn't show up as the low order bits are
usually written first followed by the high order
bits meaning the high order bits contained an invalid
value between the timecmp_lo and timecmp_hi update.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Co-Authored-by: Johannes Haring <johannes.haring@gmx.net>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_clint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index 0d2fd52487..d4c159e937 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -146,15 +146,15 @@ static void sifive_clint_write(void *opaque, hwaddr a=
ddr, uint64_t value,
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x7) =3D=3D 0) {
             /* timecmp_lo */
-            uint64_t timecmp =3D env->timecmp;
+            uint64_t timecmp_hi =3D env->timecmp >> 32;
             sifive_clint_write_timecmp(RISCV_CPU(cpu),
-                timecmp << 32 | (value & 0xFFFFFFFF));
+                timecmp_hi << 32 | (value & 0xFFFFFFFF));
             return;
         } else if ((addr & 0x7) =3D=3D 4) {
             /* timecmp_hi */
-            uint64_t timecmp =3D env->timecmp;
+            uint64_t timecmp_lo =3D env->timecmp;
             sifive_clint_write_timecmp(RISCV_CPU(cpu),
-                value << 32 | (timecmp & 0xFFFFFFFF));
+                value << 32 | (timecmp_lo & 0xFFFFFFFF));
         } else {
             error_report("clint: invalid timecmp write: %08x", (uint32_t)a=
ddr);
         }
--=20
2.19.1


