Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6X-0004GX-ER
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6P-00047t-65
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y19-0006X6-Pr
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:44 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:25890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y18-0006Vu-I0; Fri, 15 Mar 2019 21:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699302; x=1584235302;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=8QPahSntB17mOHQQQDymU6Bd+7o0p0OrEkQ1mlvsTy0=;
	b=VR/q88G4rsbLytwig+5WnxZbmbBf7lAYCmJdH72sZM6dItUhydWwMpq9
	xG2wQHV492TFySNtv+PHOlb6+4e4V07oL0EuQTnDtLjT6bN/L1jedYlGk
	kxLQu1IQcNTgIHg8grTbrwX15U+kg9aUFeGGPjFH5M2Ja32wMXxZvUw6T
	h/qqRIAfOt/Uw2ksxaZ9r4wyco173VyVLbip7RZo65kRf433QbXVJr2BL
	kkl8I9CyuP24maPMfuOzq3UHavhBb2nSRmhOPny6xmbDEtKlffdh3goN7
	UmN7uL973PAW4HMciGclOHgw5UmDYYb4EQFHxG1/1+jebmIXVuRGDasge Q==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="108600749"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HXYrFWREaMqrff89Ydml5YpAqiB3FWdE8V5a0AehFak=;
	b=U1n5ZNDmIcKWGmQr6v4K5wWoX6yhYFCVoey9LYmm8LyKULDf/FdjUlT/BUNSuN8tm1Q40lQUHR3/8plu8n1sdGV3FzS7RnKw+JUDzVvpdRWRJKog3jU4k3sTOQ0HUpQshpUGVgnbox6zG5YVZAts1AZhScw65uniSZCs5wsny8Q=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:21:39 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:21:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 12/12] target/riscv: Remove unused struct
Thread-Index: AQHU25aa7txH+oPDt0+RWNqWzi7WsA==
Date: Sat, 16 Mar 2019 01:21:39 +0000
Message-ID: <0a131426e4b8d02a2923df22379df81c8314c714.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0020.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::33) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b81e0d6-4543-4348-1243-08d6a9adbd40
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59896F6EC069F3E56B1E1CE490450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(4744005)(14454004)(72206003)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w4wP1EXrlbNMmzSySxysZ31KEo76u3P6ORvua2aWG5/YZvyA1vkubiNn5zOuCFc07zKxesbaWKJVFrxkjxmj0ap4CdGacsX7Wl7JmclcEQ86TWPj74eBtR14xlqZI2C4EMaQtwyYs/hTzyO9lDnAkR6l71XrMLrYC97lPSZFI34Dz2fFqWVeh0Px9OVUVBkz7wWwm6AAqf50yP+WGn303NOVMFTukHQGrPpyQACfmFTkove3YCn364oRGXTwqxrt+tYQX1Aby1L9mGHwc5F9H/mbtYoNtx6azPYt30JAq8cubir16E98Cl22R2r82lMBr/GqGNKUbUo4P8gWIFe6cJdUfgLpn89Nz4+x6N2DT1llXp2TwpWj9504103JTj4p20PHGZ17+VHSSS92nYT0zmf28HOoT4RV0Go+bbzOuK0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b81e0d6-4543-4348-1243-08d6a9adbd40
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:21:39.1134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 12/12] target/riscv: Remove unused struct
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc3ddc0ae4..568c4cd637 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -80,12 +80,6 @@ const char * const riscv_intr_names[] =3D {
     "reserved"
 };
=20
-typedef struct RISCVCPUInfo {
-    const int bit_widths;
-    const char *name;
-    void (*initfn)(Object *obj);
-} RISCVCPUInfo;
-
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask =3D env->misa =3D misa;
--=20
2.21.0


