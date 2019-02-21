Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcT6-00047Q-PZ
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT5-000438-F5
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcT3-0002LT-EN
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:03 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcSz-0002HA-2B; Wed, 20 Feb 2019 19:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709837; x=1582245837;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=eQHutzBkg+MuK+9r7qFhvRqlUbAmjuoDuycfdsoW7JA=;
	b=fBu9ZnuBon4YAnSIVb3SKnusF8gmBT7gERteFmTBDa22FGL3ezTKj0x1
	1mSBVvMhgj5FDjDxxc57FpLXLVrKtS+nFuR868Q9urn7N8E0H8TnSdPVw
	fZmcwK/B7uU1W4jf2QoSFLJYrZnFvaX1HyQq7n/YQBOZFOiUqn/2VFDhE
	PyFwhAPhLiR3f/vHKczl2rMswE4k8zaMG4MvINOGJhEsG3b89CqP6+Gjz
	VxGPLdlKmZHJMe64/OqvTwO/V0+hUNxRpzZecW3AeldL0fk2pNiSxiGon
	VyWF7jo0x4jAYGny+D5wZrEYHPwLjCm4Je0Rl/WGam7f9wY4Y44lyrl9b g==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="106761233"
Received: from mail-by2nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.51])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:43:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fV5SB8InIRHifiGcqdZUxttnMmEUfryYqpgS4uJJi9k=;
	b=GS94ENokFZVnnKKSPrAwhuM7o8X3nzvpxU5r8HqIT5nM+4uq2Xdano6ArQK/n0TfJcm/M2IJOa/H4Ch9qwdRA8s+8fCuuXS4p7rzKo3Z6w7EyNAiEwIxCa6+S28/Pp7haysUrCOB6i/6EWar9kVbksVdu+qfjA2s4WiTOrBVwRk=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:43:30 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:43:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 02/11] RISC-V: Replace __builtin_popcount with ctpop8
	in PLIC
Thread-Index: AQHUyX53n5462cHbPEe84Svb7aBSjA==
Date: Thu, 21 Feb 2019 00:43:30 +0000
Message-ID: <821f677eb0606393f2c624f262469036c79b0d64.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd22b73d-a831-4f7b-aff8-08d697959950
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:gDAbmejgC4TTZeeuy+/k6/4OhZjpIr28E8wGrga?=
	=?iso-8859-1?Q?tYXSM1+Q9TsWOTBac1Wb1YIj+InJBX8LM7nQAfxWS/P044k2gAVoRmGbNr?=
	=?iso-8859-1?Q?LqBP971JBeRQqk3fxFUxxPpV8FfazunefDNOE04hEwaMCaRFVv1NAktCZW?=
	=?iso-8859-1?Q?UV2zlxhUh8j2BKuJ5lpLOateyWLl7vuBs49KWTarnAXC9gsZY3iLR7CNo2?=
	=?iso-8859-1?Q?9BLNfsrK89am6dUGXqFG6CpFKV9rVg7GftQfAzl2cGlC8zrfIvWpBDsK7L?=
	=?iso-8859-1?Q?dUuPPPLwBuxgTYeCcwvmFJ6cV1LTy1VfRMp/ua3iME5NzTfJ5jZzfN585q?=
	=?iso-8859-1?Q?kbbjvjNhyr5KTTp4Rc1Ks1wZY6TANQix69TEJDLL7EckKAMlBHXDi3xskO?=
	=?iso-8859-1?Q?gR9h87eBwroQwiBD1D9IB2OGB8u0berNs1M+wyyW8uj7JhKHcDSqYGJAc4?=
	=?iso-8859-1?Q?QAIhZVt4hv6SbrSqaDaxMM5+EFpi+inw7R1CeOcYnDnkHkmqkvEpb61J1B?=
	=?iso-8859-1?Q?dq1P4caJ5DU4PkhsCkbWrJxmMDlaKvfl6ozwSVsZTfeZnOuKKPhybeW+fc?=
	=?iso-8859-1?Q?qdQVURNqZ7gurwQsHARjrsm12F79rPH7EolBvhnbJuhV34Y3aTAr8clDTx?=
	=?iso-8859-1?Q?dlhSH6LW1tqz4kDgfAj0Izaw7ceP5kkdWCYJi+zurmCD/2jiVHzT3NyGVU?=
	=?iso-8859-1?Q?ybwhuL9uZDjlHU2CuGNF1UbTDWgBYpOnXjBUvtN87azfwoplGOFsTdC6Zg?=
	=?iso-8859-1?Q?i3HuZVArWnn0KY+gQ6PPWwLveAveucWf9ASv9CUbQMapt8emJpMRaF3PPa?=
	=?iso-8859-1?Q?vSnaDz+jY2/VA7dD2VbuLGpacI1vrHxbmGP1lA5LDKn6LL2ddG3MQr5o0y?=
	=?iso-8859-1?Q?vR8sH1ccvDZWG1GLMYC6E3dHYoufDX343DlWLg/YuKJ+xyayeyrUoErSbM?=
	=?iso-8859-1?Q?AA7W5GffX3/9G1ZWACaJBMI67NAMU7jEYiDzS2bLUHGptMzWKSF6dosOSi?=
	=?iso-8859-1?Q?zbGxrBJlBQYrmsYv8Kg8cZ/DtbBj5OoL9u6ElPy9vp34PvOLwVX0FCfU+J?=
	=?iso-8859-1?Q?1Nbp08+pJVDYsnVGN985OZj+amuY8dbvczA6VmshZmEkCQqmMhxBOcBZf/?=
	=?iso-8859-1?Q?LpZNpnGDMNMctLQl8Fa9oCuI4Pxu2FOLpRJ7/4mcvkBt3k8Ad2AYZVXO3M?=
	=?iso-8859-1?Q?YcbHe+i/GsGhAGrf/a8RDn++VM4cTIV9wEytqz50UQPFrxMDu5sBW5YD6E?=
	=?iso-8859-1?Q?VJyWitV/jFB9Kde9nfVhmrS9mNgAb+E0DFDndO2f1/PfMh9vxSU78daLg9?=
	=?iso-8859-1?Q?gmRP8/xm0DlnIEX2mZWXwFJSlmWFd1dzUCZaqpcH4a2Gw=3D=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB0985B0B79966C73D567720BD907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(8936002)(50226002)(66066001)(4744005)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wZiAxtY1QGYAr39bsmS5s6EbA1MLagTKxHp0Jteo6V3d04cfXzvocOdDsJ9GApnXFV6zzg4+c2eGxmCzhxYXiMJddoYSyx9xBWHOIx3pe82NZaru/G+XsTtr5Z2lq94ejn5jj6x4db4QtMYP1DITUcUCAbIlpmD2R9spb1RxGzyG2H51lcUuz5qAlN9NLi4X6i3H0BcYjZYf//6MiWufy5OxNSMc1NrQQVQPZ2zyWF8LH5ZXzv7Pvhs2WHs4HK1Ge9Eydd3Xueky4H7QR+IBILMB8hEX8s0gdzWWJuzqbA/sq/AvGoa8qlz6QO6pbrva19e3MRX6kl6Uuh7Lwcxa/xcdu6SrOLZG9Xit9R91z8NTrjDE0/m6RSJ113o5ckVSC3DNCMS/boaG3rWBQ2A8xyThZdaUdurj23Ibi1kxHb4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd22b73d-a831-4f7b-aff8-08d697959950
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:43:29.5325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 02/11] RISC-V: Replace __builtin_popcount
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:04 -0000

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


