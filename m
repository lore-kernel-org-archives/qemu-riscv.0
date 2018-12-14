Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXbC6-0000ek-Ee
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 19:19:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbC2-0000dH-Fq
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:19:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbC1-0003Kg-M1
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:19:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:28157)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBx-00037w-4O; Thu, 13 Dec 2018 19:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544746795; x=1576282795;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ecaL16ZSjyDYZW4/ZM0vvVB08d24Vby3wFqrleDnp/0=;
	b=blAWT1YMjdyfaF9hCuIz8oF88riNLtpM6lRTvxE/0FR6fhRaFVMtXCkF
	qUCRVXaIQtSfHGUMpga3OfBSJUeNCtsU4bQ77cc8CATkqTM5yb5AQI/eh
	hKLl+yOXg2e4859rCwOLXN6Yv6LKvTH3Yv94MLUM4X5k/xyCipH4OvdKm
	HrGJOLFIqzr4mf0Lbx1U3o7MIL/2KhvF5va2J32lhezMAt90DTtfP9dtc
	nNvdzg3BzccxwkHS6JES6voa6AAoKFSCcT/swVLrQRLGYKTu2dRTC3P1A
	Bw7KX4X/4PHCHtEerbc5yID3p59SttPIc/5F0fiStc1fSoYKr1Oi9g4I/ Q==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="194449112"
Received: from mail-bn3nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.59])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 08:19:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lv+zSQRCU2CLLmiI5UKaafC+2BLy3oEGA8wyRXMFSo0=;
	b=Z/wJ2NHvMJau7+0hYQljBLLC+kkjL7LsNY+c0+PPxzKRJb9kk9yrg6Nc8c1bj18hny2TsXB1ZUBLFx+upJJn3MAUgfR53Q4hVQDLUrbka8+3o1KMAOAoWqsWXBFYVbkniyD6ARJr9EmlAneqJKWYkJcTZUbbpWvcoURN3HqYn8U=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0497.namprd04.prod.outlook.com (10.173.49.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.27; Fri, 14 Dec 2018 00:18:54 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Fri, 14 Dec 2018 00:18:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 3/5] RISC-V: Fix PLIC pending bitfield reads
Thread-Index: AQHUk0KY9m8ivMBIrUS4cbiAMHVWCg==
Date: Fri, 14 Dec 2018 00:18:54 +0000
Message-ID: <126c481d658afcc297317b2f6844a48ffe591de2.1544746653.git.alistair.francis@wdc.com>
References: <cover.1544746653.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544746653.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0082.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::23) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0497;
	6:r8iM9bePYYHYtpm2vQRU3Dvuo2sgbN22fFdNiXXegiDhUQ1sjxhks/iyJnyrPb512mSuncqeY925P3xXL0f+AWnhNLlharCaeeigvIXjmYiz07SRofWOIR2mOn33aqvZRQ9Cj9Fpjogr3ytHbZmCwrdc0nd/WgfuA/gLMz+S+pQagVmVbYxgBrzRg1BhhZXsttaeQ5q9b89jccDVeal0qpm+3XZ9IVZKfqx+Q2669U/E9BIDCml8VmmZfQ2efQRZzKGHwWGUCJPamyE/d1Tg9RkfyU8uX7mNcCO4i8AeGcc3UAPUfYfLRcIDVuZp0PpnUBf1Fhd3CUmUzUS/oZQPl3XWxamJj+U+1CGMGCs6ncRAanSDimAz/asMp5yHNbkNPy3l2cmiUFFi2QQ7DDKo06WVUViaqyrEp0Lxx+p91CYsfq2dIBN78FPDT6X5g2ZG+WjgbXbT7uQCPo7b3Vl8bA==;
	5:Fb5AtLYS26Wu1YQCQCV9CHnkjhp3GbNaCyPZTihoWk4/6M+vSUGPW3tqDhCklzTpdbILwj3MdT/kb4f5YgcAAgb/Bf0RauizSQXznvoct6U4mqys5gDGXjKvGowAw1n+5gx6zVuIw4Yh/4YUUQj6W7gq5zPK4UGLTZb4XPvuICM=;
	7:aLGE42Z2Sg7dnks8iIYXfEFYO33LyV3wrymxje5zcoKXHNUTOuGkrQJ6YDrGmLlVr1wgO7IXH0Le2oxbmWdb5iCs3TRoRtuGkY6JZR5yQiIYslXQWhuhXLUsuMx2Qu31Ivt1cVZ26HoexnT54t+EwA==
x-ms-office365-filtering-correlation-id: 3b265edd-41ce-4250-92ca-08d66159bb33
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0497; 
x-ms-traffictypediagnostic: MWHPR04MB0497:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB049765BC6B5330BC2638B09490A10@MWHPR04MB0497.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 4YnzrYgHMXqmrLQ8nAjFpyPJZHat25o6UdDL+A9/ogufyfc0EdQ6DnOjJSniBwZUSr0BCptEJiLDKGMv3J6JJ2vVttEKDlwIprfncPUSjXghzWqOB4qgSGPaVkxQcLXum2pwuPjxAkr/L6O9VszQb5GUCRoRHcmmnUokf8ZD55861Oj+6Ofw6UJpmaaH5c3ayAAqyW/DLrBX7HuJn+u/WHm4891L8yaD9nhvHZlcATxil4W8uCji/aVed8ENaEZx61tInkK6LGiybNzfA0vpRXHGir5iYgQzp+0uJYQG5VY28o8hu6Iz+iEC6vsMt6jF
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b265edd-41ce-4250-92ca-08d66159bb33
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 00:18:54.2238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0497
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 3/5] RISC-V: Fix PLIC pending bitfield reads
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
X-List-Received-Date: Fri, 14 Dec 2018 00:19:03 -0000

From: Michael Clark <mjc@sifive.com>

The address calculation for the pending bitfield had
a copy paste bug. This bug went unnoticed because the Linux
PLIC driver does not read the pending bitfield, rather it
reads pending interrupt numbers from the claim register
and writes acknowledgements back to the claim register.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Reported-by: Vincent Siles <vincent.siles@ens-lyon.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 9cf9a1f986..d12ec3fc9a 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -214,7 +214,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr a=
ddr, unsigned size)
     } else if (addr >=3D plic->pending_base && /* 1 bit per source */
                addr < plic->pending_base + (plic->num_sources >> 3))
     {
-        uint32_t word =3D (addr - plic->priority_base) >> 2;
+        uint32_t word =3D (addr - plic->pending_base) >> 2;
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: read pending: word=3D%d value=3D%d\n",
                 word, plic->pending[word]);
--=20
2.19.1


