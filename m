Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6lyW-00012W-Kn
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lyR-0000YW-Ja
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqo-0004gm-Hq
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:46:31 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqh-0004Ew-8b; Wed, 20 Mar 2019 20:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129184; x=1584665184;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=DY57obcobmknNwo+PK3NIyeylGAoxgVwAxIWm8eDEBk=;
	b=rCZs66upOILa9lNC0IxIum5t/7hrC+x/kWzyBr8GWIbCeCFl+sRebq7m
	/EnIqoINTGNODOaIpO1pJWuykX5P27X+z8p+aXGPWK0NBIGYtsAN6Svlt
	pQu0RIxpfmuovH+9VXzB/50GwCrlDHtD9npApNNXDPHxgszhZTXivS8JZ
	Qewlchj3LoJb1Ivejt+bkaDh0zS9crWFpgYHVeUa/Eo8N6cRFnXy36b8C
	fOOJaJL7/FzGzCNPIl0MmpnAAcGq+Isl5p5HmrM9iRLXEfDE3PV2+McEQ
	JeDCCTh5NktBU0k/qwAnw+MMHircAHdESXSRfQiw10DJd6CHz1/8e9zVs A==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="108934122"
Received: from mail-bn3nam01lp2054.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.54])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:46:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+JIOiOk4tZD8OXjGZAbiuBoDFEBAcFbGONhABtBY/ks=;
	b=QfIbrt2w6WMF0kuJrLsfW8W2zvhzhuzcNDbEvLLOHRHdI5GlCPcw33E6oZ0pkVInlLhwrFsx1ILhv21UvThU1LBgA1Nl3jR3LUxY0URILvDslIM9alvFPXZDVOEbQYG3VAduDDB69m7REsBNMD3O0fUMdwJPHIbhSTrIUZ7N2TA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:46:18 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:46:18 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 2/5] riscv: sifive_u: Fix PLIC priority base
	offset and numbering
Thread-Index: AQHU339/kgHud9dDwES2CVs/wJK2oA==
Date: Thu, 21 Mar 2019 00:46:18 +0000
Message-ID: <a0ec453f31a5aad72ff84bf8cc6a6b333dbf517c.1553129005.git.alistair.francis@wdc.com>
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR02CA0004.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::17) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 406568af-5f65-4ccf-7647-08d6ad96a14d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4741026537EAAD86E84FCE4290420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(446003)(102836004)(97736004)(186003)(52116002)(118296001)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(478600001)(6512007)(68736007)(476003)(11346002)(2906002)(66066001)(4326008)(6116002)(99286004)(14444005)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(72206003)(105586002)(76176011)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QqjUrvGWAt8T/ZxLWPQZnNZ/UQnwvwi8r4bYDi1f8OUnlRnjJmKiPnNPKLEEDntga4roWDFVNHcf8sLWP9xE2ku6ZB9rFm0BjGyIYI1Foc24DGKwkjuIMkoT0SAye2IalPhxDuDZxDWCx9EDuItnUd4iiNc6YALT2cKxK4Af1weVJHUtb2oxgWslMg+mETKsBOPjXhigzsU/BrGzH+2K1ErbvlvrQtzgJ1eMrWAGhZb26gCI6v8KqUcbA9pj2P+8uC6kdl2NwKyZgiF6U5rO/B8du457YbjL+DAi8+NS+2HLBSv04iGdl13QUdg8RnrbZTlZUOL9ac9Ds/HmNK4RsW+QF7kPyLd2RTcTpYPm+QYNtbYX1hls2l74glfNDYbIN6vIgdhBhw7KIElZ66Ra3H5zTLCLYwJeDN4PG8BFgJY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406568af-5f65-4ccf-7647-08d6ad96a14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:46:18.7265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH for 4.0 v1 2/5] riscv: sifive_u: Fix PLIC
 priority base offset and numbering
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:24 -0000

According to the FU540 manual the PLIC source priority address starts at
an offset of 0x04 and not 0x00. The same manual also specifies that the
PLIC only has 53 source priorities. Fix these two incorrect header
files.

We also need to over extend the plic_gpios[] array as the PLIC sources
count from 1 and not 0.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c         | 2 +-
 include/hw/riscv/sifive_u.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
--=20
2.21.0


