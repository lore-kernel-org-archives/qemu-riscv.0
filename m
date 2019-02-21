Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcU7-0005Ga-HY
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU5-0005Dv-97
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU4-0002ey-Iq
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:05 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:45763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU2-0002cc-FV; Wed, 20 Feb 2019 19:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709902; x=1582245902;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=gJbUr1ku1IY0S/4bJmp2+ImVpCbzAHdLpFVSpC0LcNY=;
	b=R9ItP3XEXHLi2uYYkmomu2oE30weWiSuhIrb8f/84Yh6X0hxYPb+t4rY
	Q3T/8CoU4ea/y19sTCxML5V0oyMO1Tk3JCtXjMSOJEOTTthdGRrT3TtTP
	dR3OWKFfCi8c3xzrjF5T74FJ9MKq2ohnriqbQ+4jVoATu1cykbGogLIJf
	2sTzsMbQfTK1SBE3ylmMHVxIzdKT5ocAPEZndm915DVHIdftbNU4VWsNX
	chH00avYMCo/zPqpIxPGCveK+IUVgsG8rhxYOHT+cKCHjSm0+Krykc9XZ
	0hNmVJ6/0PCJKJEi3lw2TgVkRcNEqYRMJEKeQyPSy0HwsynpNMAzHC9HF Q==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="206985697"
Received: from mail-co1nam04lp2054.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.54])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:44:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Eaxh/Nrfz46f6XkdkpcszDk+vyuJZ+8xEOwvXuHegII=;
	b=cT25qekeOCzHDsB6A3Gnwo4Ad7fo4JJ2PsrjRSeJWXWbNoB375oWhblIaX/bI8F392/mVTw5aa+S0WiydsYPZsxpfHN0DmpN9l9+a91+6oIzKyDRrw5SjZX2Gh14i9Mh7pHDyuB6axUtt+9NgfQxUY697v7ym2JtnMJRJshrnGs=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0520.namprd04.prod.outlook.com (10.173.190.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.14; Thu, 21 Feb 2019 00:44:58 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:58 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 11/11] riscv: sifive_u: Allow up to 4 CPUs to be
	created
Thread-Index: AQHUyX6rWL3mzdgq8kutKQJEvhReWg==
Date: Thu, 21 Feb 2019 00:44:58 +0000
Message-ID: <71002f073a6e9e611658a19bfe14e00de9790e3b.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b58b18d-cf16-4c71-2186-08d69795cdf8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0520; 
x-ms-traffictypediagnostic: CY4PR04MB0520:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0520;
	23:ICpDsXkyQp3vRCPkZUtWRNC8LTUgTkJDQ4c7bt/?=
	=?iso-8859-1?Q?k7PzccBEAYOkddxdEICfxDep5UDN5ohuBXHgTlOp+zi4HfAwOL8tP69cBd?=
	=?iso-8859-1?Q?0Y7BBDnIJulJG+PyzhDqaBkHQWQ5HEQwb3H37gpDIMWlkJIL0Jsvoas1mV?=
	=?iso-8859-1?Q?0T4Wqzzb+cb8hOdcIGGW9hBSGp2rSDZNwfgmY1Yh8ZUSvGPbI4UIM3el4C?=
	=?iso-8859-1?Q?oFVej7gtvCSF2WIuv37hRXFAUeDD14jcU1zdtROjC7+nr+igLbewXendnT?=
	=?iso-8859-1?Q?z34Vq04x8zbDjUjETKmyPyL8wG1BxLO5KikmWsPTufTWBeZB01PuRdt7nJ?=
	=?iso-8859-1?Q?fSq8OuN87FNzykPsRe+tMEWz9f8PS7dPaEFQkarsSO+K05ZtKgyl1aNtoT?=
	=?iso-8859-1?Q?s0OUxjxbB+ZpcO6TCf/BEMLqJvga2ucxcc0hGDhpjjHRWPE1fxUkKGI7Q2?=
	=?iso-8859-1?Q?TCdaUnRz0LXklH4v5igpkImmmGnCIw4EKAfuATTSDv2M31SRtBz221HvV0?=
	=?iso-8859-1?Q?o0xL60biGgC4mtqkwqBQVAM9cp1rK2mv29rbmvUV9Jkk9zHlh3cvwjErdd?=
	=?iso-8859-1?Q?21iRsm9Rm7epZre/LJI6NtMBgRSqy16EgLI3tI2ORC4QTioqdHLqQthtfR?=
	=?iso-8859-1?Q?pEmy/00EcQ1Ga904LAGjWDyIDOff0q7QYWN56m+gz53XxIptniNQthbkMI?=
	=?iso-8859-1?Q?DvoBhUl2YzH5+Tiwo3lMJeUPOub/rMVLiPIex1/5KDDKSMUbZOAuzGcByx?=
	=?iso-8859-1?Q?Hst0hYkpo8YBujHX5AYjhlHqkgUCINjQADjT+CfWs5ITjMmUtsumORVxui?=
	=?iso-8859-1?Q?wykLpNgngj8qnhovdPbiWEoPuwmiE3hcyqq5fYiFRVhhWvULwjyb2cCbkP?=
	=?iso-8859-1?Q?ilWz9E49Empg/VpAWyinuobuP8KbHxbMh/Y3YRxs9qdtcbgSqAxLM5JQQK?=
	=?iso-8859-1?Q?L3Atw12PkL1SAAHLeBekVjDTFav8AuOCZEPgTwgVPBO5BQ3CXhfk6+fddV?=
	=?iso-8859-1?Q?MLHx6+7w5wev8OghwcU4ke9OLhArgtcwGKYZQKej92Ez7/twzWr0D4+5BQ?=
	=?iso-8859-1?Q?Jqoe89U9nvzCFAtvhEKyA2R3/GEE64HS+PiEQJkfIZ3KkzUs8oG0k6TdJo?=
	=?iso-8859-1?Q?VEyW9m7KRNHoONvqKFGY9JGEicYMZdwc9qNMpQsK27FAPYPZNcP4wdO7H1?=
	=?iso-8859-1?Q?chwVyIqhAGqlYO1KnAC9mQmZNZS64GXXKySZvuPOy3rU6EWSYm52pR/UVm?=
	=?iso-8859-1?Q?/GsdqxjwSWej1IkitG0N795IEPOM5DwAHPX5/IraYB4M8ZR6LbV3eyAquL?=
	=?iso-8859-1?Q?osw5CufRPh+5Uq7OHTwKq3mzHvFIc77NEmpGO4X7qxuXAX7UKgzcS21ngS?=
	=?iso-8859-1?Q?vh2V0DAs=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB0520AD7034C8D791A1562735907E0@CY4PR04MB0520.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(50226002)(316002)(26005)(6436002)(81166006)(4744005)(6506007)(118296001)(2501003)(6486002)(53936002)(36756003)(3846002)(68736007)(2616005)(14454004)(476003)(8676002)(81156014)(6116002)(52116002)(5660300002)(186003)(8936002)(446003)(305945005)(102836004)(6512007)(486006)(386003)(7736002)(478600001)(72206003)(97736004)(44832011)(11346002)(99286004)(2906002)(105586002)(106356001)(110136005)(54906003)(14444005)(256004)(66066001)(86362001)(4326008)(71200400001)(25786009)(71190400001)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0520;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zJ6L3aJP6nlQOiVPFQP5DdKQXjcb8gMoxs1ncNErIFOL+94G/6t/kymF38K6QJQ+8yjf4DLaDqlBZs/7uQbjkS0tzoC0PAzrMuvHQ11vrZ7qN0OxJga98GomoAByhYIWmBN+dz88MGu6ioD5KwvDSmc3SH1tHsYPBQfP9z2wVu3+OH336+5ccQcT5AJGJcWggj7ymkEP9mOx9bbl2YxCyXMqA6ikM6QNN4CTw/CsFiviWDJ/es1H7ZnCxL2nDTCbTpTW63QbWSFVeSYQjkgciSh3rB0W52fqyr2sOAZedRBbcn51OCgBxoIC06Flx/jJkdcEW66u5f7wtUNtmNSREoGJqY7c/Odbs6/kHKaE+G+w2+t4ZgJm1VsqNWygmfRZc90jeG/8dQuhv5JLj/DuOS8+4GMoZUZh1kkevWp4taA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b58b18d-cf16-4c71-2186-08d69795cdf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:57.8704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0520
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v2 11/11] riscv: sifive_u: Allow up to 4 CPUs
 to be created
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
X-List-Received-Date: Thu, 21 Feb 2019 00:45:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7bc25820fe..3199238ba0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -398,7 +398,10 @@ static void riscv_sifive_u_machine_init(MachineClass *=
mc)
 {
     mc->desc =3D "RISC-V Board compatible with SiFive U SDK";
     mc->init =3D riscv_sifive_u_init;
-    mc->max_cpus =3D 1;
+    /* The real hardware has 5 CPUs, but one of them is a small embedded p=
ower
+     * management CPU.
+     */
+    mc->max_cpus =3D 4;
 }
=20
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
--=20
2.20.1


