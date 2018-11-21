Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPb5L-000436-UE
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:35:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPb5J-00040O-2B
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPb5C-0002bx-O1
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:35:00 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:57384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPb5C-0002ZS-AL; Wed, 21 Nov 2018 17:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542839694; x=1574375694;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=uzqaVDLMqdbYKBfOxO4xHyeS/tEbR7Ybt5NXi4wGvwE=;
	b=joZ1YVn0u+drZSor6HQVvPdOXiKWELFrMd8wBbgamwLo7EYOZhNzwddV
	qljV5mBOnOpVgWFdpbMDHIWD93usWGQw6jSZQc0Ivtv+K+62mD8yDTNm1
	fJOVLWloHwPBfsTjVBb/32CmBj+AbuYJ2MJJsK7sJzszHTpo3CNavLInP
	kIHv2+JFs/yJhNDJKa/lDUof2UhpZYy92w2VQm1B7g4bZ/TK3Ona0xPbc
	uB9NYSKHFebAgErcdiySUSxEojVD+WLCdKwxh+c5sRIfO7U3MpoDrU0bi
	qjUW1NEfMVJ5c11aUttNaTwlYG04kfQbW3AkSaelqYuZORB9CyUw1nIaK g==;
X-IronPort-AV: E=Sophos;i="5.56,262,1539619200"; d="scan'208";a="96026784"
Received: from mail-bl2nam02lp0088.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([207.46.163.88])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 06:34:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VFJz+u9VjSCcN6D1jaRImEBYrsbtrEUcXrmkE12Z7bM=;
	b=kYbOP4dLRq5iWWzo2lggpGMiJq5TzUPZ8pou9NLzTt5xS+QwctyPh0whz8M77QdEk3FPWLTmHJyTkD+JrOTlA6yYgckHkBhOhxPtyMH8fV7msXLy0GT3gvS0Q8f6eslP0rp3HcF3A1XODKvtC/JfdhCkKvXkJisYDaqb8rAeVXY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0224.namprd04.prod.outlook.com (10.169.201.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.20; Wed, 21 Nov 2018 22:34:44 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 22:34:44 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "agraf@suse.de" <agraf@suse.de>
Thread-Topic: [PATCH v1 1/1] riscv: virt: Cast the initrd start address to
	target bit length
Thread-Index: AQHUgepm9sFy3jkz0U629PdLFONivg==
Date: Wed, 21 Nov 2018 22:34:44 +0000
Message-ID: <6559716eae4b53d2cad39ec6011cdd7b1b32138a.1542839652.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0087.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::28) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0224;
	6:7NC+7VER/lg6foOsxb7e/lZjxXlUxs02xANbC6Ba+pac9Nnwh1NtUSDzk/K1OrCJp9hIUPG/6XCnMP4oIvwbqEQiuU2KB9JHhA0geujGoo/QeiUGI75xsZ3Z4QGRuJDE2yOwiuHFlFDOQ6xuBst6donph5IhH+mg0IBaRa8QtCs+gMLuAD1uFOZc0jIagkayJOuL1zpZ2+63gHKgl8TWwu0cTVd18bxjZBd0LxI1HGtdqZT5aBfKwVY/c9NBwTRtzSPQT2X8xtbCT6t+MG2J+mO7+9VGWxszydQM81RuNpSvBvFrImVGnj2Tw7zJn/6l4/7HAD5uyVJXKDsdBvuhfQ98ZQL5mrflhgXEqKTnCXhSYRJkvkUvM1tiOY2OayyuiNZC8wGLWbE1hvN/gI8CNhsIrNqfDN+LH8VTbuQ1k3K1sCjRkCeJe34rwsOikmCRnTxRYbZFFnriiCWNLJm8uA==;
	5:2TQBn0bVPeqY9NlqdMQ8v6rbDOMbg98cHOp7JdRKoEMYRWhVNwlZ1VEVKtdbXQc+67v3A8f12/WoRDrE3fC5AsT+iJmV/JaomN/BGzbSbf9h+qvPvq/c30UT6xo/ArylRxmC7vjUic+dTiSeoSuqcXCCTmAz3PyR5l0zSgvMEUI=;
	7:1ZfqrROppG3QLjQgcJHYgLH9cpw8jZA9MphUXCcBnJaU6sKAwKywAJXJP9ndOrjH6h761/Ma+xEu8usJXKwdjaw1bA2TKpnYMJXJc/lboIq4qRQjYKOIKfn/EaCwn5O+d/yN8yKemYK5jbCPzcTpqQ==
x-ms-office365-filtering-correlation-id: d4ffcf91-3f9c-4600-089c-08d6500188ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0224; 
x-ms-traffictypediagnostic: MWHPR04MB0224:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB02247634727446531BCD657F90DA0@MWHPR04MB0224.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0224; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0224; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(6512007)(476003)(2616005)(71190400001)(71200400001)(486006)(256004)(14444005)(44832011)(2900100001)(14454004)(26005)(36756003)(52116002)(4326008)(6506007)(386003)(102836004)(6486002)(7736002)(2906002)(305945005)(81156014)(81166006)(25786009)(6436002)(86362001)(72206003)(105586002)(50226002)(316002)(68736007)(478600001)(53936002)(39060400002)(106356001)(66066001)(8676002)(186003)(5660300001)(97736004)(99286004)(6116002)(110136005)(3846002)(54906003)(8936002)(118296001)(2501003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0224;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: tEiGywyJOw8m5W02Zsm8vlQ7iiF6lXfbYPrcSklP+FPGndGq1pkJg3OjPNE+rpYuTHMKUFBY6Sfx1c1kHsV4zsH05HKVeBziOYM5X1deWYALsvZjUlxW9umxauS/F+zM8RGvEh5LbpOZHE6pCT67uLNgZXrvrZxDoyru1ILuWGjQnRxKxhuPjtywNozt0+AnpA8DuYMBc+fDekKV+yUl79XZKLmEjLKS3TvnA8ZgmnS/CnAGYJ7YHIC7Gl1xeKJMN1kJk46+h2M2UplTOofrOlObhqQpiMrWKJyoqHV4xBwDUPVsmcpPuuYRWs+0stvxX+OcsuEIfBaSB02pD4JRFkgxJadwGiwfEhr1l0I1poY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ffcf91-3f9c-4600-089c-08d6500188ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 22:34:44.3828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0224
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 1/1] riscv: virt: Cast the initrd start
 address to target bit length
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
X-List-Received-Date: Wed, 21 Nov 2018 22:35:02 -0000

Ensure that the calculate initrd offset points to a valid address for
the architecture.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Alexander Graf <agraf@suse.de>
Reported-by: Alexander Graf <agraf@suse.de>
---
 hw/riscv/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2b38f89070..4467195fac 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t=
 mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
+#if defined(TARGET_RISCV32)
+    *start =3D (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB))=
;
+#elif defined(TARGET_RISCV64)
+    *start =3D (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
+#endif
=20
     size =3D load_ramdisk(filename, *start, mem_size - *start);
     if (size =3D=3D -1) {
--=20
2.19.1


