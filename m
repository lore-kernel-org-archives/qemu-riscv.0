Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JNM-00085Q-N6
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:22:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNK-00084A-Sy
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNI-0000IV-N6
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:10 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30649)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JN0-0008Ee-0s; Tue, 19 Mar 2019 14:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019710; x=1584555710;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=BhMydo8zzOd2l3dcV85NG2hGafFCEXopZWc6e2JRQwI=;
	b=IAp/eR9/vApXoomYVApEPhPsFpud1WkctI5+YQOHzhGfIfw4b2E/1rgX
	UPoP0HRij9AwyPGKlpqzoWn2CHbRLtT0CevEPpiicSr9v1hQ8sXv9LRHV
	4NE2zObiojjUKDDpBdNFGxm+LTuAyU/6E3E73RDKedqC0VtvsD74pv60U
	DEGuDzBTEaHT/1ab54QNDtUPfSo65yWkmiXm2OzlLccRKAsxDMPoyhZ3x
	rq2e6aiRa6JBBVMjHZMBeLUmgBs9yUNkMiBEfq7SVis8opZZcAJs/Nzmx
	eGFpLXiD7mI/EAPItd7kRxa11vZNj9MMi9xhDCIznjNNDX0TlCdRFR2xQ w==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="105112664"
Received: from mail-sn1nam01lp2059.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.59])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:21:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=V4pbjb6IuL2U8eaFhZ+iJD7/mwlLJ64YR248ntZ+uDc=;
	b=I0F8ahmKhr7DiWS/LbZlXEhbxHq6kOXakh3YlrbKNpfhj1FdUn52w9RCrgApI+SF4C3NgV53Yl0vaavLwXbO4SVJ376e2iOq4USIYUNEIbgDyZe06ECI3ZCCszw+vZeSodieVeae0P1DhEkQc7a7lATFwunSiDpJxTZAhGUSw6w=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4326.namprd04.prod.outlook.com (20.176.251.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:21:32 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:21:32 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 5/6] target/riscv: Remove the generic no MMU
	CPUs
Thread-Index: AQHU3oCUeXYSCsAJn0SRWbaJuVqbAQ==
Date: Tue, 19 Mar 2019 18:21:32 +0000
Message-ID: <5192dd7d90cab0837ec848635b57128988b6b1bd.1553019560.git.alistair.francis@wdc.com>
References: <cover.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0052.namprd05.prod.outlook.com
	(2603:10b6:a03:74::29) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6e47349-f302-4489-a1a8-08d6ac97b68f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4326; 
x-ms-traffictypediagnostic: BYAPR04MB4326:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB43269BE3479A3F55F4CC437490400@BYAPR04MB4326.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(71200400001)(316002)(6506007)(44832011)(4326008)(2616005)(11346002)(486006)(71190400001)(105586002)(446003)(476003)(6436002)(102836004)(99286004)(52116002)(5660300002)(53936002)(118296001)(386003)(26005)(25786009)(186003)(110136005)(6512007)(6486002)(76176011)(72206003)(54906003)(256004)(68736007)(66066001)(106356001)(8936002)(14454004)(478600001)(2906002)(7736002)(97736004)(3846002)(86362001)(81156014)(36756003)(2501003)(6116002)(305945005)(8676002)(81166006)(50226002)(41533002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4326;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nRvbmTBdazpc9dam0CFLaAAoQwsBLEs4+MMnC9bzK6yb6mxGnuJNQ3XHXyDJ2MHZrS0ZZOBpm1P4TtHAKS8njlSMq1UZRBPEkLYi9LqcafEHcfWbOAxV58/yvadDafrNvKUWoF0Q677m5jFwy/jEZJR9xOjfPPPBoUE6qR51YjX5CTjVgTIwUgHbIlYTuGuu2WNd2URK+w7ELJgunEZvladqIxN3+hDa4x+NiDloCOOiiIWKR5+ips57GA5EuNiyvGqCkOP1WZDvorrK4drb5pnxNBOg1VgjZcAoOw8JovAePIxLPBpH4k8szG2kSIPVQKkMAHG5IzlN0gYoZ9zafJ0erF7spQ5wWVDd60OddrSSZiB/4wusdiddL6eoiHJtDioYWlPIsu5b9EP3veQVsFQg6PjyLbBe9F5CPK+7aDg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e47349-f302-4489-a1a8-08d6ac97b68f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:21:32.5491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4326
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.1 v1 5/6] target/riscv: Remove the
 generic no MMU CPUs
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
X-List-Received-Date: Tue, 19 Mar 2019 18:22:12 -0000

These can now be specified via the command line so we no longer need
these.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 --
 target/riscv/cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 298413f6f6..1d507c5216 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -570,13 +570,11 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_09_1, rv32gcsu_priv1_09_1_cpu_in=
it),
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_10_0, rv32gcsu_priv1_10_0_cpu_in=
it),
-    DEFINE_CPU(TYPE_RISCV_CPU_RV32IMACU_NOMMU,  rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_in=
it)
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_RV64GCSU_V1_09_1, rv64gcsu_priv1_09_1_cpu_in=
it),
     DEFINE_CPU(TYPE_RISCV_CPU_RV64GCSU_V1_10_0, rv64gcsu_priv1_10_0_cpu_in=
it),
-    DEFINE_CPU(TYPE_RISCV_CPU_RV64IMACU_NOMMU,  rv64imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_in=
it)
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d7caa294e..2b26f77a5a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -50,10 +50,8 @@
 #define TYPE_RISCV_CPU_GEN              RISCV_CPU_TYPE_NAME("rv*")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.1=
0.0")
-#define TYPE_RISCV_CPU_RV32IMACU_NOMMU  RISCV_CPU_TYPE_NAME("rv32imacu-nom=
mu")
 #define TYPE_RISCV_CPU_RV64GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv64gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV64GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv64gcsu-v1.1=
0.0")
-#define TYPE_RISCV_CPU_RV64IMACU_NOMMU  RISCV_CPU_TYPE_NAME("rv64imacu-nom=
mu")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
--=20
2.21.0


