Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6r-0004Uc-F9
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6k-00047t-Ti
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xzl-00062G-8A
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xzj-00061n-T1; Fri, 15 Mar 2019 21:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699216; x=1584235216;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mCLun1Y9Axu1r6fvxhmrSiAqMURw7y3nhcUh8Kr5x5w=;
	b=mMIH8mIg0ULXVDO9W341ucJsi5KSgAPX8cXuub20ph9FZi3yo31oBDvf
	fNaSqjug4Sps9JZS2HOki/z+MGfPLRprj5kygHW9N59xdjxyv0sjkrMFX
	tOKYIkpAMhkCWeJnGu1BFddwOMP3HPpq7Z148/d8l0wCckGBgD16NdWqd
	E5YMPwOF5wJ63LKthPmifokZu3TibPD/7tRw2URPLSciv9x/BoGBYGDkt
	HhT7BGcHZbOBEqvs6RuooCiDswq2I0s1SLynQv/dQCtvk6fOb9FFIcuQM
	OZq9FkPe8vbQmHAYtJJWd4j66dFbZuvwl//0jPC0r7olqNyN4HcfYaTPI g==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549421"
Received: from mail-dm3nam05lp2050.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.50])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=14pIia74s1a1FxKTI1wk5jpcUMHB5A19clcgb0H/RP8=;
	b=dxIdVVlYfa6albWwr/gfCa4RCG4mMQB8w44tiQaTc3gx99tJeUb+I30zPYooeo0588mGiOLI9Jh/StAGixVkws1ZZvGpE8qdVDdVSr33KsmlHnpNKJN3fPupFj8P5paGi4GcRkehKhhoxlBuqrCnQDAEXvOSRkxs+liIa0S374Q=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:11 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:11 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 02/12] RISC-V: Replace __builtin_popcount with ctpop8
	in PLIC
Thread-Index: AQHU25ZmZU1d7vevV0ao4BJjkHw34w==
Date: Sat, 16 Mar 2019 01:20:11 +0000
Message-ID: <3480947c0d86c0c44ee30b2df37d92dd4d07dbc9.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BY5PR13CA0009.namprd13.prod.outlook.com
	(2603:10b6:a03:180::22) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acebf6d1-83a4-47d3-aaaf-08d6a9ad88f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5989767F69F14B71C130A45990450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(4744005)(14454004)(72206003)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NwTgO5R9vXDepkS0pbpMXMgDX92++7JrtfVvP2bEmb8vLVb3nEb7nKoxG144kKQdg3vqsAILtj/KPQ02nlJo94+T7XklInWpZQTYv3fauXKUMLs2uBFzyyVaUApJG6JMBqzAOYTlzVY9LBdSEnalqiMObdmUpf17pfAyeXYFAuGjdCTyYq3hfJkxrxSVMaJtsq02rpMJ+m1fm6NKwtyhnl8YqdiSfkbgAToQkQGL1bpeewzoRu56EdkeBZoOEySMrNGOeiXORrwKAzBoQB5/7YfvHy9qXbiuSFqGi8QoBazpElHHxCzjUhWst5prM4cT55WxhonFJLRpQQnjINpJ0IM/0OZ6QwtFS9WcFFeTdm6tRaOOt8fnkro8OGJE6wD7rKmraVTn+J7/Q57WenAIR94MTVPMmRp/ZbBi/Q3KahY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acebf6d1-83a4-47d3-aaaf-08d6a9ad88f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:11.3608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 02/12] RISC-V: Replace __builtin_popcount
 with ctpop8 in PLIC
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:32 -0000

From: Michael Clark <mjc@sifive.com>

The mode variable only uses the lower 4-bits (M,H,S,U) so
replace the GCC specific __builtin_popcount with ctpop8.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index d12ec3fc9a..b859f919a7 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -383,7 +383,7 @@ static void parse_hart_config(SiFivePLICState *plic)
     p =3D plic->hart_config;
     while ((c =3D *p++)) {
         if (c =3D=3D ',') {
-            addrid +=3D __builtin_popcount(modes);
+            addrid +=3D ctpop8(modes);
             modes =3D 0;
             hartid++;
         } else {
@@ -397,7 +397,7 @@ static void parse_hart_config(SiFivePLICState *plic)
         }
     }
     if (modes) {
-        addrid +=3D __builtin_popcount(modes);
+        addrid +=3D ctpop8(modes);
     }
     hartid++;
=20
--=20
2.21.0


