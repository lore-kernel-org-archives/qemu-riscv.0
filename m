Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQlp-000889-AC
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:47:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlj-00083E-Gi
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:46:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQli-0000TE-76
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:46:55 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlX-0000QO-Na; Fri, 07 Dec 2018 19:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230004; x=1575766004;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=iAGxPDcOadpSCu8DO/V1CniFAICyX9XS5FFyAxyMm+U=;
	b=RUATUNHplKrsPQWj5STM9uAPg2yqb7FO+wBJyEpBxRJNcrZ6oIaUnPKP
	cJKPa5rPpwwz2glG7fInGW6nG4vaXvG5GR6Kg4a2TIX55fUwjZAuYahNN
	3pgoWc7hCUj5cWuRAEtSekGFwlbuJu0/IJnwHP0MZevuK/93xyZFp3zRG
	a54FyCRwNHXyBOKQvFv8Cvjv+IipZF1MR6jlfNTLPpXDwuhY9AxgKgU/D
	rBc6BDIB3hp+G9TXntPyWmP5dnVNlZxu8WKWVUGq5rIzkK+UM9Cdz68qC
	SgpZctI4l65kr0/bpgb2+l6INhPqfZyi4csCRqvz/gRTXfUx50YLIDZrj Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="101011981"
Received: from mail-by2nam03lp2058.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.58])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:46:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=un3jzbQjiTiysTp1gsp/mpaRufVmQ0D+2qgz7uF6aRQ=;
	b=eOQ7t9ck5Dd6TOAzHX5jEab3lDuLRUhBD7g1BQJ2R6+GeuTddS77Icc+qX7ujvzuf/Hnn85POxPZyG1g5N8CYzH04xlSqGOPTamZvQ8UBGI8hHTLIv7aX+OpQsfnNa2ac65UKtn1IDA6fR8fWWYlsPsSJzmf3CL2U86hv5F+lGQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:46:39 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:46:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 03/24] linux-user: Add host dependency for RISC-V 64-bit
Thread-Index: AQHUjo96t4vdZwfie02g8UNnKp0z0w==
Date: Sat, 8 Dec 2018 00:46:39 +0000
Message-ID: <6e77872f033be3d16c60161a260c75bb8b0368df.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0016.namprd04.prod.outlook.com
	(2603:10b6:a03:40::29) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:6XR/O0YlTh2vr5ghu5zRdKG2IJeLqJ6ZNxCMx7924y+OD2UQCLy3NuqWgc8cb6xlOX+D8HNcmUXi4BKIreds0CGDAb5JKi8t4gt7M2uP2wj8B2mUqzC2oeS7Vs3VcNlihhQhz7wm/yDsvPBN1Wdzd2TiRa2xBJapLHR+tdbII9D0vjMexVdR6W4cHiiizH4gmHIuN9uaZHrSW/RAlZaS4nZcqH+JHOR0amYUijnINH0tibtmIAn009YFfxW7A+0B2aYK0aNifB7z3kPzd9SHh/o7KH7H70gi3nU7Fc88cQGRzE1gL8x5/HKf1nqf6pCCWJKe0yWW9MXts0y+vcHgTlIwDbSlorFm3/Sj0ALyVAU6H6zh6MnDaIHdb4ltvB83RBj2A5/R+aoHACIB2A1ay4/3iI/v+7MPC+aQCQd7bx/sdLvFNlM94Rfw+sWjjG369YZKyBDxaMTnbJ1Ip7df6g==;
	5:9pay3atj1iV4UeLAyxJGz/s1s+H+MJPzh31Zo+TKgr5wJK2SKiwt7Wyj6MfEx3bG7LVJvi3gTSzWsp97mHXn2g/rC7k40vleQyGCiE+XhKoEE4s3LrvvguGDb1Z44hJm9MNMeNOF5MXWcH1gx0zRJdVXASOnGwqujZ/u0HOBTws=;
	7:Ch/XxBQNex7SvuJ59ztoDA2LR7hP1i/1Jm/cfW1WMo52j+FcEEV8Z/vLBuVC8FCG8fjq3M0HwdGxsbseEUtIdxI66jziKZ1trWE+9t+cF4PB1jVc6Ao8npx5ggKILrczE1QE65Brhivfl0P6rRaKlg==
x-ms-office365-filtering-correlation-id: d2309601-cbef-4162-0b72-08d65ca69d2c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37256BB7D4E61A1290DCEF7D90AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: TYM0aZOAmTXPmJCsfVFMnR1lSaF79THdbyTLh7TRpZ7hcT1jPJQn6VDP4uZ08cKCDc9/hLWwXR6nf99ZGLJZZJvoMMwA4u/NIy3uLMh3vSTadNeMyGCpL5cDhSmZRirLY/fWbTAkwk32tgYu29efC3UT74n0Ac10X46whZzqgEiDDglIu32uP5r3MQxVPGwzMRJaGpjbYeFaO7uQk/3EllNHl78+Ghg8HPkSmVgg2NGW2kQErVW+Z3pnZEiit1LYlGbWwSMZ0J8BQt1nYNRSdYeFA0AI/jOVN5tg1oTtujStBesorbXogVtboV7FPfYBWjI7zsopjMDJVUUT0wj0wbBhnH2DkWkhiRZu0TFcqFs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2309601-cbef-4162-0b72-08d65ca69d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:46:39.3642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v3 03/24] linux-user: Add host dependency for
 RISC-V 64-bit
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
X-List-Received-Date: Sat, 08 Dec 2018 00:46:59 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                       |  1 +
 linux-user/host/riscv64/hostdep.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 linux-user/host/riscv64/hostdep.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 97071bcdf4..ddfeb32c6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -263,6 +263,7 @@ F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
+F: linux-user/host/riscv64/
 F: disas/riscv.c
=20
 S390
diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv64/ho=
stdep.h
new file mode 100644
index 0000000000..28467ba00b
--- /dev/null
+++ b/linux-user/host/riscv64/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV64_HOSTDEP_H
+#define RISCV64_HOSTDEP_H
+
+#endif
--=20
2.19.1


