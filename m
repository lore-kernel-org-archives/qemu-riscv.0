Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Dh5-0002t9-WB
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 14:54:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9Dh3-0002eu-Ug
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9DeV-0004uW-OQ
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:51:58 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3157)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=982a4e6c7=Alistair.Francis@wdc.com>)
	id 1h9DeG-0004qf-GI; Wed, 27 Mar 2019 14:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553712700; x=1585248700;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=+McbQ3u7pSiVvq1X4UzDG/xhIHOJBUtngx28tuT8kck=;
	b=Mby3hu4GXY0lzHvUvx9ITmbkVvr1sw5xAGMAAeHVTkXXKD9em8hjAF6e
	ycH669KRrv35GuoHLH/A4T1bwE5o2RYz164gCxhgAe9j8WQIVdvY8zzDN
	0N8+otiFYD15Qz64nZMq7pIzv3ScIL6powUqEf2RWQIKZxCHAQtbaUFlM
	KLYxGfJaOfmzeGZVq4uJk7uWyhjcgyHEKjj2zLvqwARLUGm14wYaSzViB
	y5BEU1xpX/ewdvYgBGe9gMqrlrNviQEwguuU0rVm2VHV1bRZM9QAahe8H
	daeaquueUHq1lyJjPvwK5lT3c4uu+6vhESb/FERJ81hfzlgyyuo182kVz g==;
X-IronPort-AV: E=Sophos;i="5.60,277,1549900800"; d="scan'208";a="105752018"
Received: from mail-cys01nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.57])
	by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2019 02:51:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RZyti4Y/QB3Gi/MVqDSxOapl/D5ax08xUY2Lb+FYTT0=;
	b=fNgcFXfApRhG3p91k2UhNz3XCalI6YLxx20Zgv62bIlg3R31FcHWe8WWfUbD+nqnGdebF7GF+R8KhpMWJinzc0AJZCijS9xdUmupuTM46Il24bi0Hlmn2K8XRm+BHRVFeyYsITEDHjhTAbsXmLCtST/Cca+WwJpXL0B++f4L/8I=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4821.namprd04.prod.outlook.com (52.135.240.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Wed, 27 Mar 2019 18:51:34 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 27 Mar 2019 18:51:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v2 2/2] riscv: plic: Log guest errors
Thread-Index: AQHU5M4ZouIELc4vH0GZ/YeQ+LXrNA==
Date: Wed, 27 Mar 2019 18:51:34 +0000
Message-ID: <51823496a00b8c8160f10b541275188b61dfd05d.1553712571.git.alistair.francis@wdc.com>
References: <cover.1553712571.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553712571.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0059.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::36) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65076626-0b96-48b1-1358-08d6b2e53c16
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4821; 
x-ms-traffictypediagnostic: BYAPR04MB4821:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4821C03D449809CCDB000E5A90580@BYAPR04MB4821.namprd04.prod.outlook.com>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(186003)(486006)(4326008)(53936002)(106356001)(7736002)(105586002)(50226002)(446003)(3846002)(68736007)(110136005)(2906002)(44832011)(476003)(2616005)(118296001)(81166006)(8936002)(316002)(11346002)(54906003)(8676002)(6116002)(66066001)(97736004)(25786009)(81156014)(99286004)(5660300002)(26005)(478600001)(14454004)(86362001)(72206003)(14444005)(52116002)(6512007)(386003)(102836004)(36756003)(71200400001)(71190400001)(305945005)(6486002)(6436002)(6506007)(2501003)(256004)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4821;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tr7F18UYm2U44kwulGnauMkFX/4D3lmnpzOkr72pKhCuVQI5SCEBOOlK9X5dvlsfiJv7vc90SfI0IvE+yij0S3RZBWHKhLcVASP7GHfEcjsCBsS7LStr5DXOr2/U2I3oSxAGJge5UzNeWsZ2Cn9VNZY9nTYaqAqCZub03qXPVnWaQMFj5x3gDzD6FaLPtPAoTCWA9HV2PZfRJRtz3TKEzF9Bk1eUFzmlWxEvgQGewtJcesaxbLVbpL8ZAa8/E4ZzWzw+HmOJamHOou3LsnIFDG4STidONTX/MHc9myiXnwfP96Nj/QcFn+BiE4wbVITq/LxzOMAL4+hfHo6vu/GhcLF2B6FLZ8PM2sLeDY8xFKp2QE5sV3EawiL5ZDF1jpCSnLqZa7H5ygHHpb9TBikFps4SSDMB7CC/lVd7mIJwSBw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65076626-0b96-48b1-1358-08d6b2e53c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 18:51:34.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4821
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.0 v2 2/2] riscv: plic: Log guest errors
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
X-List-Received-Date: Wed, 27 Mar 2019 18:54:35 -0000

Instead of using error_report() to print guest errors let's use
qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 70a85cd075..7f373d6c9d 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr a=
ddr, unsigned size)
     }
=20
 err:
-    error_report("plic: invalid register read: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
     return 0;
 }
=20
@@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr=
, uint64_t value,
     } else if (addr >=3D plic->pending_base && /* 1 bit per source */
                addr < plic->pending_base + (plic->num_sources >> 3))
     {
-        error_report("plic: invalid pending write: %08x", (uint32_t)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid pending write: 0x%" HWADDR_PRIx "",
+                      __func__, addr);
         return;
     } else if (addr >=3D plic->enable_base && /* 1 bit per source */
         addr < plic->enable_base + plic->num_addrs * plic->enable_stride)
@@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr=
, uint64_t value,
     }
=20
 err:
-    error_report("plic: invalid register write: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
 }
=20
 static const MemoryRegionOps sifive_plic_ops =3D {
--=20
2.21.0


