Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6lyW-00011q-Cy
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lyS-0000YW-Mj
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqd-000497-MA
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:46:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqY-0003j6-PC; Wed, 20 Mar 2019 20:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129175; x=1584665175;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=2Kyl+NJvYnpLetRWzm2H6cAvR05eeL9/X9h9V+FVJ9s=;
	b=S6yJXBcX8EM6NPadY6XsbOJPix20cjI+5tsu3HyI0BOipj8PEZWIGbq4
	kl8IRg28X89mJQl1P1KUI3I9QC5VsJTUMQgzcuZs6Rq3TytPR/i+hE8DH
	MrJaLYVWMVqYS+vGT+Hi+ir8NWBPRK6QM74rvm+lro5O9sv6TdIRgf9Aj
	rivlIBt3FGLFhJwM31bcVWo7C0xPliQBkb5ubdKg4PEygWb/4lLC4ORmA
	k0UO2KY7P0haWVd6+T8lXMzojxbRBID9B5Xhq0ybJpbm3QINFix/DkbG/
	ej4NyaceBSvPXVKWXcldWunN4JMfF9NQt3FOPG541kPlbxXCOl+Ft2fvw w==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="108934105"
Received: from mail-bn3nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.50])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:46:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OSOS5zTA13rAKjLi3hbUDeJM0nut8tqX6afoG4WoJCA=;
	b=EioBBjoJm/rh5fCiRgF/ZvE6x3JZKSxtSGudvaSsLjz6Uwt2B34WGyw5O7AeIFvY+0wKb9hsHwxTb38ggcXXZqnAogMuXPDc+h2DOw0VGdMf3E3GcSFy7TXiL6aMqbI+UIcSTZrl4YJntbaUnAN2OuvXLvhUxSzr36Z5tbUovBA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:46:09 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:46:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 1/5] riscv: plic: Fix incorrect irq calculation
Thread-Index: AQHU33952URPaAK0IkCQpT59g5uD1g==
Date: Thu, 21 Mar 2019 00:46:09 +0000
Message-ID: <7efcf90aa1cc78d1ce2c5f823a7ff9ac96c379ed.1553129005.git.alistair.francis@wdc.com>
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0068.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::45) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a4ab3a-d3dc-4304-b103-08d6ad969bc3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4741E82EA93B5C4762C69EE390420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(446003)(102836004)(97736004)(186003)(52116002)(118296001)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(478600001)(6512007)(68736007)(476003)(11346002)(2906002)(66066001)(4326008)(6116002)(99286004)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(72206003)(105586002)(76176011)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FupC6X/1387AGo355f1GsnE/QIxsmBBsgWGlGItdgn1yq2dEJsYmRPbv5A90vhHsjjzKMfkFWzXVzxXg/12e6UpnClNqlZAelWe0iWLRLAAd46qoIpZvfNh95F2drx5SMDwiRTVkRa6M1VRhOZDTdpTmXp+0lugGCjpin9s0e03Y86KlG/DWwZjPWRAEb6HbKwGeL8kE8uxmfLQI/TkH39tbXojAQR/Qfb1aDuDrsWJpyLYzkui4jUW5HqDvgP7jqKLfUAZolTnJYTF1Yaq4FbU/8duTUx0oLcc7E+5y8HyzvRBAsUkp8k2PPUfIrqrQjhSM+4svfwhZeYVucsqWpAo8pnw9ONAZCNXv33/xdlFqgBrFq3ggVR7mTx0fYAPFZNoAuybQWqYZwiF7y095ixxGWRRXCRhBEkaHh9JAsDM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a4ab3a-d3dc-4304-b103-08d6ad969bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:46:09.2979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH for 4.0 v1 1/5] riscv: plic: Fix incorrect irq
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:25 -0000

The irq is incorrectly calculated to be off by one. It has worked in the
past as the priority_base offset has also been set incorrectly. We are
about to fix the priority_base offset so first first the irq
calculation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
--=20
2.21.0


