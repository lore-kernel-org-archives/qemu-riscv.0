Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAT2-0003DU-2o
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:46:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASw-000393-WD
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASs-0003e7-Ll
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:42 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASk-0003X3-0n; Wed, 12 Dec 2018 14:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643990; x=1576179990;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=dpz4/gnPBplgoUnvtKnRzRogXNhxbdNcpFehJNuVSPo=;
	b=km3bieK0HYup8ImAVzPLUrbXS0UP6n5pSLWAG2okfjrZzzSFz756Rp+J
	pdTGHW8UKFgaamTn2aQPzhBgoGW3k2Km9UJXaYvvMbnE/DW0xwpmHW9UO
	tiaM3gnoLfqRYwUMH6tQ4Tomi7ZVKhwJdSzUQiTAczi/x4rxabm3Jo/BS
	aDiK5+u7TemfvwLWZ63teFOKVolVB7GYWnKLAmhgtxoc9UJUyBMcUMBRf
	ODcMAAvuP/WLw5ojKEiIHJH7KVIfDdt063onBO7Oi+QpoF/YZiYZVv1YG
	iB4ngK8yKLzhgoa9VdjAvFg7hui1Un1XnGs++11EMUX76yVNb/gYes/cj A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="101342426"
Received: from mail-by2nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.51])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:46:27 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=f5Q8HqkYUTEKhA+dMcNe5+Q7rqVmp+QpEog945isH8I=;
	b=DEBZ1zbUnJ7MrHXYHHOCT2QIjMn+XK9nSpnpri0SL4SnWBk6hKOETe4k08IDOfNC45kr/7is0KKNPbRDqM1cBjoK2yYhn6D1CIsmzjujzh4EFccDCa4l4m/aALtdjFD245827u0mAT2/pnfVWQawZRlMVqMldisiJjVZmr3tUb0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0446.namprd04.prod.outlook.com (10.173.48.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Wed, 12 Dec 2018 19:46:25 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:46:25 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 23/23] configure: Add support for building RISC-V host
Thread-Index: AQHUklNd3qMbeMYmdkeETM0eyVdnPg==
Date: Wed, 12 Dec 2018 19:46:25 +0000
Message-ID: <d816afe4d7dfbade1743c440f4f277fe1c17662a.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0063.namprd11.prod.outlook.com
	(2603:10b6:a03:80::40) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0446;
	6:LrIeOXltcCViLUELN0obptYtdSYFfk0isR3HNF95dbu1/dhK8g7HpKXXQxwKR2T3T2z7pV2ZDbbyr9IAYjDKSMFjP5H6lsq/lp+OZQiNjCO6d8H1czsBRjJ73f2wpkoVLMYpfqt1sG87IJUXxewVo52JwsUBbepXku23ntTdU9VF4YzzZQ75zmscGkS1f2TIeP/uheHk/mZ4LRFZrEDC6Njyk0iAUyri6LZ/ityvB2awaM4Ct2EbCojJ9ikQdUP0KT62BYA/2D34Wj/K5U658K6s+ulRrI6WM2TY66xmeiatmJcjM7kp5Wnb5sXQ1twSQsbZMaeNIoOVn8uc1os+oB+6JKuyTwDzZOxES4SaUlKqBU7maJJiOQapETK+5LQ+DIJ/NIDS+2YrAHXuoRU0uONkTO4yV4DXFFrpQn7n5YwK6FdVrDs9MQgcikG1m0MHcw9xZEZ7tnX3/LLqReXGIQ==;
	5:6z5WH8XHX+2eP8dLpslvpafrpi8Keg99BWXwxS9xTtiLaZuA8ebx4NnfdUwMjUYqa9SdbMNRz9hJWgqK9do/mnAMgp06RK8C9P1xHOynYoU910f2ZxmkSiVf3qU/Ygqbzy8nviXJfRFAwA5MP70TxCXJRckHhHW+WCIkT3KTsyo=;
	7:dr2azMtdYvDZN183jeidmkjUTlSqMFI91KLZXGRmwDJ42ND2VVpzRlzM0tdCJYXiao5omoiH1GX+Lm4nL6kar2uUFbwCfBeintaFVCZd/rRgBg5wVmzKoH/Uu0hv4KCmVq1ZNHvZapvyjtLojvhzpw==
x-ms-office365-filtering-correlation-id: ec85ad63-9e77-459f-d284-08d6606a800c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0446; 
x-ms-traffictypediagnostic: MWHPR04MB0446:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB04465163757D681305E1361F90A70@MWHPR04MB0446.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0446; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0446; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(3846002)(71190400001)(6512007)(97736004)(256004)(66066001)(2501003)(81166006)(50226002)(53936002)(6436002)(71200400001)(8676002)(106356001)(4326008)(6116002)(39060400002)(105586002)(478600001)(8936002)(6486002)(305945005)(386003)(6506007)(44832011)(110136005)(81156014)(186003)(72206003)(68736007)(7736002)(102836004)(486006)(316002)(54906003)(26005)(99286004)(76176011)(14454004)(86362001)(11346002)(476003)(5660300001)(2906002)(446003)(36756003)(52116002)(25786009)(118296001)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0446;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 7yX0w3CpqBr2kp6xBrS4zwrvz9uOXyr9YhVqxTvjnAk1DFqSaU80UuUk3AV11Q+cYPZ6+TnKH5IoTw52ll9sjqElMF2OrQiZs4cTM++FgiE/YXWZoz+DcxNjQlW6Zuyry75nwbggdE+2ApQgcV4BB8Yiin5wh2pZmYrv2G+QQvWwlJ1uTw419SDwMlmuHE7nanCH8R74Gwba51NPBlvYww6GfP4w7xX3yWzJdRzomdweiV0c6+mbO+2kJ4DBgDjVTzkEaaePV5HeLS1HdMNU9BW7yVAed1e0a+WH4wXGT2yQZJfsNe0wTpuJSSmdoghY
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec85ad63-9e77-459f-d284-08d6606a800c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:46:25.3127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0446
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 23/23] configure: Add support for building
 RISC-V host
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
X-List-Received-Date: Wed, 12 Dec 2018 19:46:47 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0a3c6a72c3..2e13ee918d 100755
--- a/configure
+++ b/configure
@@ -709,6 +709,12 @@ elif check_define __s390__ ; then
   else
     cpu=3D"s390"
   fi
+elif check_define __riscv ; then
+  if check_define _LP64 ; then
+    cpu=3D"riscv64"
+  else
+    cpu=3D"riscv32"
+  fi
 elif check_define __arm__ ; then
   cpu=3D"arm"
 elif check_define __aarch64__ ; then
@@ -721,7 +727,7 @@ ARCH=3D
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390|s390x|sparc64|x32)
+  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
     cpu=3D"$cpu"
     supported_cpu=3D"yes"
     eval "cross_cc_${cpu}=3D\$host_cc"
@@ -6900,6 +6906,8 @@ elif test "$ARCH" =3D "x86_64" -o "$ARCH" =3D "x32" ;=
 then
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/i386 $QEMU_INCLUDES"
 elif test "$ARCH" =3D "ppc64" ; then
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/ppc $QEMU_INCLUDES"
+elif test "$ARCH" =3D "riscv32" -o "$ARCH" =3D "riscv64" ; then
+  QEMU_INCLUDES=3D"-I\$(SRC_PATH)/tcg/riscv $QEMU_INCLUDES"
 else
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
 fi
@@ -7397,7 +7405,7 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
   ppc*)
     disas_config "PPC"
   ;;
-  riscv)
+  riscv*)
     disas_config "RISCV"
   ;;
   s390*)
--=20
2.19.1


