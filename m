Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6lyT-0000yw-QG
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lyP-0000d0-M4
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lr6-0005ma-P7
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:46:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:5518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lr5-0005eH-Az; Wed, 20 Mar 2019 20:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129212; x=1584665212;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=+McbQ3u7pSiVvq1X4UzDG/xhIHOJBUtngx28tuT8kck=;
	b=LkzIouy1NnUzE6QdrERCOPG6z9skY00/N/4edn6777umcPqSbblJ1evU
	iKbrsuJwMO3WHhWNY/gwRfRhaLtplDs+TM6T3tgaVTTTTLmE1SJQYXKRT
	qmNw5JE477zA6hITbAXLEz6LImpBPXoH1KvdeGMhxFErfPFmAA2pveb36
	Q/OuwxM5YP2K9RiCi+MyQwZ2i6awi+WXDkX7HHuDg/F6C4894pvYxwnHy
	ZkxA/cvjwzSzGMocsnESMpqaPy1lH5C+4NtGzdBB9TiE9NrpELkqd8Qja
	75BXyujrYJu8PzCXmMt2Awncqbsx69PjfZtAy7mrm/5fyh9evsPS5gNsX w==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="202570803"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:46:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RZyti4Y/QB3Gi/MVqDSxOapl/D5ax08xUY2Lb+FYTT0=;
	b=ecFqzks+Y3L36vsejh555M4z17BBs7duyVWRDEiYwLc67TaoHoV2RZFNM5aPtYAm3C+qB1fACy0Y1X/vifgl3rC7Koqe6xgvT6U9koFYuQ4VEKjS92gqWFYV4LryRnz2zWpYTgyVQUh/kTlFNX3EXDtcY0WKvHh6I/VUotTcCI4=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:46:43 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:46:43 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 5/5] riscv: plic: Log guest errors
Thread-Index: AQHU33+NDglHEWTVHUSMigfNJNcezA==
Date: Thu, 21 Mar 2019 00:46:43 +0000
Message-ID: <5856b388fa5e95444c910e3ae629038ba22dc37d.1553129005.git.alistair.francis@wdc.com>
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0094.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::35) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 491fce8b-53ad-4aed-a1f0-08d6ad96b03c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB474161B2190E4317424D09BE90420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(446003)(102836004)(97736004)(186003)(52116002)(118296001)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(478600001)(6512007)(68736007)(476003)(11346002)(2906002)(66066001)(4326008)(6116002)(99286004)(14444005)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(72206003)(105586002)(76176011)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZNNdM9uhTHzOw2N4Tety8nJwfshrxHih+6G/1+lxhvdyu6/moN3/sItiIzRwchrknue68usOLheP4EicjA8vVyEQfqz8jgYk4HYuHjdmBusk2aWALfHN6aOZqN9Wn2/kbgSMJ4MAN9D74tm1A0HBA0N3yoyGaUsJs5X88Tx2vUj5tq0yT8NFIxLdzeM9z+86N1MGhGFYe4svzktIUD81vCbGh8xqe/sfgAQ2aWKd+scsh6KX1HVDqpjfn68qtNmnrTDKRhY4ITErLY/EPRjjkLJNcu4VGMl33bsO1CR2ywYoEWc9Yxh0vtLbJUhJyxxJQqD47nRqkYsM6yN7p5mUMdFCWtWI5QiFk43tHMWBr3TA+6SLTsYmzvg4KrwVLrOJPxyMHXURtFJCOpX7+dJHZUvViqomKtWrllJs69XSZag=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491fce8b-53ad-4aed-a1f0-08d6ad96b03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:46:43.6479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH for 4.0 v1 5/5] riscv: plic: Log guest errors
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:22 -0000

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


