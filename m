Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsGzv-000599-DH
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 19:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzr-00057K-0M
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzp-0006BX-Ql
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21453)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzl-00066Z-KM; Fri, 08 Feb 2019 19:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674003; x=1581210003;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=eQHutzBkg+MuK+9r7qFhvRqlUbAmjuoDuycfdsoW7JA=;
	b=TrXQFvxMle+cmPxvjNWJOYki6FiSuY892MYSYaRwmokTqY0W/a+5qQCF
	1pZhkxUT1B1C7kbcb0+cbB2ggliXA5Zv+mcKA+lzEhbK6QhOG9RPhL5PK
	As7FrWmfaKD/ixHbRHfIyTVyPsbdBE62XIaccBAz6Q95sZLZD4BcMP9Ml
	tkhBbnYAAU4OcB/F4Na7FpL5JTxhoD0w/g7A/iCfxe69bwIJF/mqNLIof
	hZdoV+PpYMtvb9qthCoMCJmbyUXrWboa4kltQ0UGT4BTTaN6YPvFbOx4q
	yXNvowOGXlEpYMTO87zXRD9BDJOPeJD+AFzYSAsmMbHBtanvCMIsD1Eg4 g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="198999454"
Received: from mail-cys01nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.57])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fV5SB8InIRHifiGcqdZUxttnMmEUfryYqpgS4uJJi9k=;
	b=aiTVf3frhSno6t5NFdKBJWihz/Y2jqkxPWXzprmY2H0/2Q2Zsah9e0XSksQYuRwshS1CaJ2XNkJxeJkwwhv3T3dSpZ0hYcvO3TlCukLXXlFnHDSIR3SB50HgsC60csuI9QAFSMh0JvXm/PSpEq/Fo6oNKSA7dbBms113hNi8h4w=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 00:59:47 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 00:59:47 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 03/11] RISC-V: Replace __builtin_popcount with ctpop8
	in PLIC
Thread-Index: AQHUwBLAg9Cek6sczUOdM2721m37XQ==
Date: Sat, 9 Feb 2019 00:59:47 +0000
Message-ID: <f3876e4e18060732817a2f657a8bf4e0af75d4d5.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR04CA0027.namprd04.prod.outlook.com
	(2603:10b6:a03:40::40) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:8EwhbvtAv94cPSvynSJObRfMFh06A68EUA1S0y9sOEPa1s7d3MLl2n52dndR/R4ayZ+9ZrjZCZk33hVirat1x3PDc07miuVsWAvyRrlzdYPyrk36+o1V2TqwmlTIULpeMJaR1fZ9dS45ScswvsoIGV3Ntwt7UZPUKa5diGBdNbgzK767dYR/WzKRSL7vznDz9iERvdYRXaOMbsY+rZPfH357QxJcExo4ze13i1ad3/BRKSyhUbaxnFPZ/iFGAr9HN4MRxgSU2vKA0rWesJUr/U4yYjAe4aipwA4w/JhDmA9WWkgcyj2Su2XDrI2vpX39N0fFQVfwHT9f39uJxuKs1kxKVtKGDkaPScEylEGB6jl4sUuXaiFe7pkPLoym5EZSNID1zrz2gb7pNTF+5ypmisgy85p9RIlteRvkBUyxgh4sraqrRCm/P+bsCS7SiamipZgp3XQ1le7qvVpVaHxVNw==;
	5:hvSJM4eIo/f115eKe+DWIsciN92Se8djls9QVLWagqpJxMFiKn3gVc30k64e9CpXV/HzAD0eZnt797xKMFibJjuMm+OkwxWgX8wLLV3gE2+ydlqLAz2B5/TKMMjDSlVcEuSloYDYrFgz1DB1e83wxRdJUw86tV27ZZdthvSoDh7P12tdv1+lkOfm+/aVUIeMvgrtoGvveN5lKcC5VErcRg==;
	7:JxnUiPaHPF8M+r7HsZdZ+0iSJeBKya99WHpy2LYQYQv6qsQHVZ7Sx5C++uemwuzKlkjJpcDgL0guQVQ6JIxdCKvhbBEyXpjY70eB3CAkmI0xY1Qq9Ogtl16f4Wek6sQmBN5RIDwDgyBv4ZIICt+JOg==
x-ms-office365-filtering-correlation-id: 3fd10182-fb16-4c1a-c987-08d68e29e2ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB040933140884F49CE94E58B2906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(4744005)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iT0O+AsGIjt3KxeIEmG9LloK0Pq5t1pMEPeNUFGnpjJFtK/tiHCfykRFxFjzMfUcbsWvyxaeX+No9eafLV1BoZ5tnblREFnPJUCJyDJ7v1W4OXdvUpM1Who+h7rRi+G0xMJ9qH4lhUGI6LFDrKlNKWCDvL1VIpoGWlkX3ehixS2VeVJ8E+vk4l99/eWC+TwYWZPyoO5POPPJof2aFYT9AYyKfT+FBEp/ObpwqPXIe6w5bR2boF+EnWpFDkfxv2du3GoOr3VOdeMgc5jYrXBaqER7HL8wGtdUJrrBu9Pz1WJOdqsb+Uu9kuceyezahT/zFClqD5mBn/fhF2QFRIdLhRxYZI8QU1RAC3w+zeOci8JjFFx/WHIvNnQFHf3cvdbSTSPdsWFYL8iPlkqRxMVESRbEeUfhVF319+SgHauceaM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd10182-fb16-4c1a-c987-08d68e29e2ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 00:59:46.7276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 03/11] RISC-V: Replace __builtin_popcount
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
X-List-Received-Date: Sat, 09 Feb 2019 00:59:58 -0000

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
2.20.1


