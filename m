Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhL0-0000rA-5j
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:16:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKx-0000nP-VX
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKx-0008DE-2A
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:55 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKm-0008AW-Cl; Wed, 19 Dec 2018 14:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247004; x=1576783004;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=7Os3cJyYrHUFl3hWLTP+A+XeM3N4lo13NaEZ826/bDk=;
	b=gD9yfBTGHIp4wkJcY9/dyFbtOUGOa/IrZm+ELIpH5/QWGRCDAgGvWyxq
	hnjCUnGrX+iXebupebGh4uxU/DVLnXxa1YlfPzOpEoZmhfygxFU2Na8RT
	3OK+NmYLdlESi3t5bLiButIe9WhaJ6NV4vN1+2FhrPp6SlQHSIAIgeqDh
	oXG2tGDaZ8Jo6n92tgRK5GDSA9DpoG/ZFPSZBJLdvt3/f5EqJ8UiCzdyI
	l9PsEeNTHWNpTjxehjiyVHs2+R5M7zVJS35qYQZPihDPaMNA7osqr/Rth
	XLueYb2CoBObDr1umt8FOl8owtu6k0KlDUO6YwQaIIjPqeIP5eZP7q2XA Q==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="98234150"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:16:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uBcd9S0NVzeMrIHhn7w+pxRFA7FwKjCxYFsB/xTxGEY=;
	b=bAPf1CYzyKVjQ144WIJRQ+qNXFt/W6MLUDZCzW7Q0QyD7os2uAlhgUMKl7VJWgu+0Es18a6AuMsQQrksjO7sh22ggtgJFXEAVWdLh61z8Z4kQkLBcRoJGfmvtnbpizBydNQJ9sa9eHLHhq6aHqlVvee6zv8ZrCNKdGBGBkTpMyc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:16:41 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:16:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 03/23] linux-user: Add host dependency for RISC-V
	64-bit
Thread-Index: AQHUl89fKWq1gaKU+UusQKDKb8bn9w==
Date: Wed, 19 Dec 2018 19:16:41 +0000
Message-ID: <9d777f619840a8dd8e4f3834dcfc3bd28e052ccd.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0026.namprd04.prod.outlook.com
	(2603:10b6:a03:40::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:tAVWn9/FIjl1xHl36gmjg08QBvPJmCQj9yKlpNyeRr3vAGGzWsnDpfUfb5G8haoUUbsPQ7gqWZR3GW6Y2eqtOOLnV32zbsg/1BoJwHe/WmUtyWemEXaaughrKwuAG+NpyVo0XAXwzGlKcfp3VkFvDbY1KXErInYnD/YdoXRq7ImElxb96W2mrX7alYvj/747YRFycuB65DO6iEluwrkC5RFIpEx75wkYMT3Yah2lvzzuTuehuMCrBWBWuCrm8DA04kJNT+HxNaKStAipoEdsVNh34CH7PSFV4X2mndMqxZRRbVpMGS6a7bxCCpNn8vtWilnSJvxTnnYU9BXogry9JWvvkj1n2Q4YtlSONERNTAYdjwYKdCsnJVR0L1TKQr6j6w2h9ygr9vN7MphGGVIy8rCSXToXqT7I3OrQ1zgU7jCD57HLwacPVGt8nxkoyX0NAYrAsbgaSNYf3E7FIn11Mg==;
	5:1VU669IrfRwavR0zXcE47RxdTkz+phCL/vTixweEve/TdOjQPp90jplhfmc7oNYUbVeEqkwkVe4/rq5HnM2GyMvnmKqWRAGlvRL7Hf6iFQdOyOTsUIz/dI7+l6keYQIupqCte2aOWh5F6fg8PWrJTcDAbkNK9R7w2bhbLESjh4U=;
	7:2iH9IVdhSN2NkL4AIvrixPnp5PUiGPxyiW/g/rWeI8Exbjb2tpX5EBKtHpY+DO6R8hckGNvMn4pXCdWF4lA7eHBADSz3AVGhjWsmtUxFnSAKkANqpLVkTYRAv+QxVI0anOFubwqCSi2wiXl0/Gor/A==
x-ms-office365-filtering-correlation-id: 582206ba-9775-4800-b90b-08d665e681a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0271B781490097F0C922066790BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: h+Kh4mrpp3bMaTPeOcVTK2VIzWH22KvD3OVwPvQ4W+/qeIJPTCyXqjN4r+0S8IKSOk1xR7xB6PGL2agKCxMcfou6sANvssuVq3Roh/+97DNh+ZjoxPTUcJ7xSPFAuXOmZ/4hWBCejt4g+KSxWeeVbr+ngv/JPEtdLIuTKb2mEFnJ4pC7pOsrSqVnvwGcinP7NuOUfUvbFO7JnKoI/StKICGzkpqr1v5MHsyqI3iTd0ksnYLx/Gmg2PmLB7oPQ207K9WQXK4kRSqOYBIllAIlBB8hUVZ/ANYH42ZAIsXCcYUVO8VcI64S6RnDIAzSDoEB
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582206ba-9775-4800-b90b-08d665e681a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:16:41.5642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 03/23] linux-user: Add host dependency for
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
X-List-Received-Date: Wed, 19 Dec 2018 19:16:56 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                       |  1 +
 linux-user/host/riscv64/hostdep.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 linux-user/host/riscv64/hostdep.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ff561ce3a..b923f4c1b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -267,6 +267,7 @@ F: target/riscv/
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


