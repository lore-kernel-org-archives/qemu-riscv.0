Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhKj-0000fa-Kd
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:16:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKh-0000dc-7r
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKg-00086V-Dz
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:39 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43313)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKb-00084W-Um; Wed, 19 Dec 2018 14:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545246994; x=1576782994;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=gJgiSuG0iwlK1F/hCf0xcFPSmg0ZPzfNDeuHdD65rtY=;
	b=NfnqIM36D8k2zVbYMHl/Z3HYsSQLzigVar3HE246e6c7xs1Ob/ev5PES
	aoCU/kPmQPyh0HnOpeftoXDDtvthiDx/fkwS5TJnUGceQCNcSG/ea2JZo
	ick+GINWo9R0n5a1TkhfVHKbCtmwibAztIO+oa0LbBIdzpvezTlOB00No
	4Y1NkBVfl8Sx1X1K4UzWcX/tYPe766O5f9mktsStkSlRGVeYPV8qdtfNx
	ubuUBEUm5NGUQNTwn4nsqBb2TQLU25Xnzl+txf3ehyz3emr7+fd7V0maJ
	hCIDAOBKLDjdO/xvlmdpxD0kV/iYGaKSmak/ZNdO4Oe4wx7iKHmAngD8Z g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="98234143"
Received: from mail-dm3nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.56])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:16:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=16prZPjZjnUkBMlTeKUtbB7sMygQ2Vko46249thdqgs=;
	b=I41+IH9HI9ozx9Hjas16IAVj8srxWNGHSEPHfTOmibrwnxMrztMYFE0oON4iup9TWQ/ZG2WsCj737zq5h98OEtUCRwMEvEQ7XFExcOJxGJBx3L0mH3OwuyXh1F+h+yHAzfB7tm/cQGDhDodZ5foPC6AiATXsKCFmYsy794z/PQk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:16:31 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:16:31 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 02/23] linux-user: Add host dependency for RISC-V
	32-bit
Thread-Index: AQHUl89Z7beZaTJF8k+eCQe3lLLpUg==
Date: Wed, 19 Dec 2018 19:16:31 +0000
Message-ID: <76f8f9383a766dbcade883e897dec8cfef669799.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0017.namprd04.prod.outlook.com
	(2603:10b6:a03:40::30) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:TeBJr2E9ZWWhrgvve8y6q7AR9iY/1IZRLkXt7AsBGxUwbl9P533jGiz3lPFjjbohbCdonDQ/HV6nogkajfbgso6x9Xs1eKxeq/0FHPL7NP7gHPOldOJKJVTr0XlJ3Ew0LuNbHEFNiLyCbrKDEwYDgTEWbJK35MGFYU1ysmSGaauifnp1MpfYRr3p2QGDNaRz+tcSnIn0RNALAOjvoUj0SgY7FPrmsLNCJmqTOCrU3EWWCB9EilOhoFwbaWbMRgp1bLvlwJKEysNY5/z7x4icReqpghQborY3s7d5BBu5TGuqj8RbZMA4+LjilEMBGSUJ2UqkTPGQsAhVfBsxOWV2eDObZdmMWtdL0fkxSei3Qoug8zJr2HFFmdkLQQgupQkDLF5dJH0c2IyRNHq/r2+CYnzqRasZSd5njqeE9Uje46BqH+hkB1iZzP6LqwR43c/jNd9gqgDhhCrD7uLtP3yWtQ==;
	5:g9XkgtoyrZ0I34lSZKBjVsGrB6AMx1+U6MAUJoj/gDLfaSjZZJhFH+KTXQsUCguXHYTKGQ1T+WJYLlVvlVXKUoc4XvTRBv4BnVUoVhFn7YBrzElm3C+FbMchW1YbnmI1SgV5H09p6oYnF6i3iFI1dGuOL8KpI7SvK4+eIwbl0v8=;
	7:uglThXQXOyKXttBICUSQRHBx2ROOiIeJ7F1Tv4VwOjdB4KFAPuUHT3f6xuN1S9OqCilae+KRMTMuDFk0HxOK0LBvGmGUYJz7ESnPwCKXwMYqS8zkrVbFYoX1fbddtFm8BZP02MJ2T2AN/OsLedLAkA==
x-ms-office365-filtering-correlation-id: a7872934-2117-4200-0ea3-08d665e67b86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0271FC2441B202207C2E910990BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: P7ZU9w7V+4LI0654YWlwBs90ALnmlEF+uuU+6vs1DvzggwYEGiYiW+xKujv6jYhDGKXI/yUFPX7A8nsGYaB+YlowmzjGiHegXPJXOSoSqbC8VgHYfuuEMxTJsA2+G2t4N9LJMdti/TvaGiqVeeLfYLMAXVTWG9aV6BxpfPrpYmGQQnZqo/BdfSzLx0HudxOxXEpVaxoZyacqt6cvBiw0PU3Q33vSbpL3X+zZhz0xPlFF4r+eTvdrqGtyHMSNoL5h9iJqjBfiHnjB6LhUYfwtaiFtxR0To7DOMLob4EWDBus9iZL7BDvoR5PWHS8ALBAJ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7872934-2117-4200-0ea3-08d665e67b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:16:31.1572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 02/23] linux-user: Add host dependency for
 RISC-V 32-bit
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
X-List-Received-Date: Wed, 19 Dec 2018 19:16:40 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                       |  1 +
 linux-user/host/riscv32/hostdep.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 linux-user/host/riscv32/hostdep.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d676c73f88..7ff561ce3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -266,6 +266,7 @@ S: Maintained
 F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
+F: linux-user/host/riscv32/
 F: disas/riscv.c
=20
 S390
diff --git a/linux-user/host/riscv32/hostdep.h b/linux-user/host/riscv32/ho=
stdep.h
new file mode 100644
index 0000000000..adf9edbf2d
--- /dev/null
+++ b/linux-user/host/riscv32/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV32_HOSTDEP_H
+#define RISCV32_HOSTDEP_H
+
+#endif
--=20
2.19.1


