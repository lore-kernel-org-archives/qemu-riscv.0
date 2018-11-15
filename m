Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQH2-00007H-9s
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:38:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQH0-00005g-CV
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQGy-0005As-D6
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:38:06 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQGs-00052j-9o; Thu, 15 Nov 2018 17:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321478; x=1573857478;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=sNAkeF27UM3OtLEjkEGHG14JH25iJ1vHDWmedDNdOG4=;
	b=mD7E+dX5zMf0boQEpGXw2hfGHLqFZb/WoxvfIBNpsOU7t29iFKJoDFrc
	ZLUD/69ru3eK20bFbpMjuKEZz4kROMdfY+tD7KjAmLW5P1KH9SOxOkZuH
	5m+AXzkeobKoJPuZ38PA/6sMSF6FS5N45eOXgcKVRxrefgIpGX8AyzjFA
	BqMg+vG+fz0oSvfTMf2y+gGNKnjUj+9oLBy8BnolSfCbu9Z5c2oHeSCq3
	aRSWOYe5Td+7eQPB7CtSJqich63pOkHZBK6HZyyScKTmcVBMYcFCePJob
	A1qFEF1wuuQ4V8EvaUJ8Nm5nBa9S4yQ3I+xVVxpdy3SwV2dSfUFanZReK Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523469"
Received: from mail-bn3nam01lp0177.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([216.32.180.177])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:37:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bT0/h0/F3SUICJU8fPqLe86CfX7hlSOVHi2DEF6jp2U=;
	b=etEgCVUKm4B25iMy9sVygRDjyieeYB5Te7c/YoXdZwrWQvMUHzL/R+5OR7lRGIOSbvdd/Sa9lIo6cYfaNNobZon+97Noph2n5xrTnAyqVJHR05e/G+MxpUC2C96Knf6ZQmr4rrBgWzPJhWUQ+4hIE1yUzqO6w1dy4UjImnX4jOI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:37:22 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:37:22 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 23/23] configure: Add support for building RISC-V host
Thread-Index: AQHUfTPGjVeH6MKMOEKTZhqeG0wMdg==
Date: Thu, 15 Nov 2018 22:37:22 +0000
Message-ID: <b7bd19036aa7af06a54d904f5473d97bd8dcfc6e.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0077.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::18) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:iZinT/KwwQ4VKQP2ndeAACj6h354Khmov38pzOnegwaJTojmqv1em06CtDsqfu9b4LA+jphhjXmPCXH71O5Fki8EB2fsUVfTe1LmpzxmheCgoMJGQu1aZl/aBkyC8fvH80GlFWjz4dmTwBVibdNHh0YPFvTGZctTWnAOGD6tsGs0HMa9qacltJiDaGRBCJl/wkMPvIhyN9P4boPrO3sDkxqjd2whL9x/Yaq2J2un2DoJMSkxOJgXZxXrjcgpqsVc8Ur42fPk8tG5LPHH0CSwJJ5eUDwvgD4GZ7Vr+H3WzugDHyL7LdpdEyI7Km6Rv+QEsOpdwWMguQX7PC8h7LNlzCIbVKe2dT50eUJTZhI91ZGHosLoW5HNMtcwNJM0Yn7sZyDuSf4+wXT50g45E4XYmrvENu0YbmYPLVrrZChzU68LFdhvrkzPC+DTAaSAv1jbYXZQuziCr3+dC34rijxDsg==;
	5:z9A4DbZ8I/G4L94z5hru20HVUKbXEaiSmJe19trm7Ap2qgO7vbFzLlawXRTaIphffIoyYU2Ek4ghDrfIRFfpBxRtRLPoo3iMLbRLE9u+sDC58UThyKjNXYQINVOfLDTvEHFVjEqsGv0qm8JX4Do2uHM8UfYW16nDkl53rkWYIoE=;
	7:Spzv4nRtXf58BRZHlLo4bXRCPfvKnITXUxgFyG6eceQn7m0bMvtDpT67fqqaJZ4kgvGFn4z0Y+FnnQ7LDA6c0u07xOcqm+a+NubQDI4p7OtiaiUB+KhwGpnds0mcJA9L6juhTe/H40oRMBOSF2MdsA==
x-ms-office365-filtering-correlation-id: 76c36f27-7190-4039-82a2-08d64b4ae89c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0865263C1EAA03BF1EFB0A7D90DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0865; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0865; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(118296001)(8936002)(256004)(6486002)(25786009)(86362001)(2501003)(72206003)(105586002)(106356001)(2906002)(97736004)(478600001)(66066001)(186003)(99286004)(54906003)(386003)(11346002)(2616005)(446003)(36756003)(2900100001)(486006)(6512007)(476003)(6506007)(26005)(39060400002)(102836004)(5660300001)(305945005)(50226002)(71190400001)(71200400001)(110136005)(6436002)(68736007)(53936002)(3846002)(316002)(4326008)(6116002)(7736002)(14454004)(44832011)(52116002)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0865;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: pzktIQX027uzaikkLhYL59NfE6aYDRgYwGyRINMVRHOoYIaJ1bQ6P1ouXhlC5GiQK60/0QTKw0l9wuuzfRkiFtCMEDrSEBFYr8R9rt526X4iDklzFoe9MoQvsq8QmrAAdsRI0JWPsQLHyt0vRvZV2BZZC/GMi0QsxDwdnaSypthnTryn7jJESITGljFi3fpEPUKNo/QySklOdEATrYhUfj0W4nCXdyHomX/NwQlITqYfRZhzWhxmPbpdYrUTnsNHRGEjjbzotPLz5WOT+89I1nWFYnuPBXVC/W8P7750PBUrTHltTR7tjtFTfZXYEBRELa2JQv8ZD3siYfYHHQQSkobgqGi0QC6tS9ijmpE25p8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c36f27-7190-4039-82a2-08d64b4ae89c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:37:22.5411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 23/23] configure: Add support for building
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
X-List-Received-Date: Thu, 15 Nov 2018 22:38:07 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 configure | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 74e313a810..8a7b9fc933 100755
--- a/configure
+++ b/configure
@@ -700,6 +700,12 @@ elif check_define __s390__ ; then
   else
     cpu=3D"s390"
   fi
+elif check_define __riscv ; then
+  if check_define _LP64 ; then
+    cpu=3D"riscv64"
+  elif check_define _ILP32 ; then
+    cpu=3D"riscv32"
+  fi
 elif check_define __arm__ ; then
   cpu=3D"arm"
 elif check_define __aarch64__ ; then
@@ -712,7 +718,7 @@ ARCH=3D
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390|s390x|sparc64|x32)
+  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
     cpu=3D"$cpu"
     supported_cpu=3D"yes"
     eval "cross_cc_${cpu}=3D\$host_cc"
@@ -6809,6 +6815,8 @@ elif test "$ARCH" =3D "x86_64" -o "$ARCH" =3D "x32" ;=
 then
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/i386 $QEMU_INCLUDES"
 elif test "$ARCH" =3D "ppc64" ; then
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/ppc $QEMU_INCLUDES"
+elif test "$ARCH" =3D "riscv32" -o "$ARCH" =3D "riscv64" ; then
+  QEMU_INCLUDES=3D"-I\$(SRC_PATH)/tcg/riscv $QEMU_INCLUDES"
 else
   QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
 fi
@@ -7306,7 +7314,7 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
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


