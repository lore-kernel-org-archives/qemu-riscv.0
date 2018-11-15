Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQDn-0005fk-8Q
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDl-0005eF-Nh
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDh-0003bg-UG
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:45 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:39993)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDU-0003Vd-1P; Thu, 15 Nov 2018 17:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321267; x=1573857267;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=+Q/68XbiRgy5O8qXW4yXg0CB7h8NSHcOkAcnF2zuJAo=;
	b=YlIujyCK5U5FZPWyTg98TPSKeQc7iPfPl/SzFp174yWMbOgIDVUCBjFA
	BnzeuaD1pvsp0VLXdHcvFtmnjizm4Adntegs26rXHDrd0jBksQFzJ40hP
	DZWKSPn3CDkpiJ6VZLbSz8HtX1SHO5JC42Z3/cWLhEZvbJxBU/sy5PltS
	qC6HvgessqvwB0FVp105bQSds2eqnP28Jczd6agN4z0D6uxAxhkutSEfC
	wnUsh3Ev26L0/aU/8aYsyHwIwGW3AHFQub5olKaPN9lmuJcSofVzPS0Db
	CpxJW9P7QNvfnBrUomcOSO/lt+NTCoO4DsXJ6YzIX7t1xNkJelolwQK9z Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884174"
Received: from mail-cys01nam02lp0054.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.54])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+Q/68XbiRgy5O8qXW4yXg0CB7h8NSHcOkAcnF2zuJAo=;
	b=VtL+QSA4q6uFvGyjPVI5E3H1kcZw1RNuUwjBTKuu9BOkSSPGsP9yAcG3THeA9WqMHNLVI725CidpsaOiwITHXc3uXt6FwZBwe9HvXER2J6FNEr4ghLadHExGbo72454FoCEE+gFB47JL+Af/OjwA+rP0dmuWH0U27lOBsTZdQkw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:34:19 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:19 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 03/23] linux-user: Add host dependency for RISC-V 64-bit
Thread-Index: AQHUfTNZ9CJCtfJYR0G9g6gknVs0VQ==
Date: Thu, 15 Nov 2018 22:34:19 +0000
Message-ID: <0f62035eb86da24f03b9980f086d6df268105986.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0047.namprd11.prod.outlook.com
	(2603:10b6:a03:80::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:GydPR02Q3BdsaePn9oeDeODTPwF6meLpxX6jk9x7U0eB4XOF8eVPF/fwmjz81Slkf+BdqJgnr8iyl78tWFYUF5KDkOtSr9Ia5N4vd1X+TJ3KUohR6mOCJThZStIGnmX/zB5INio03pJk5Qv3p77naJUusS27vfUwLzAX3slVS5D1//EZ1vRMgTZTP2uW7wBJZTmHQ/A1/uY1wStRymh3Bi/+0RgSLcFaG47Hwbn+PRcPsJI2sp4ZJpKX4smbZHVJjh8WGNX7s6ydp7Q80aGTu+DEr8lS3261456eCwulMkjkDnKBt/ZJveDHS0o5slCYnKEeJF7pmcuASGynoEajseolPT6Z4L4Hb9kSUN7LGowrgQcU+QII2w9TyCTYxQ2dMfQhBFYu+zdjG6qmEPOpYz0vF2efvfpX/OPIl0OJPRnXdOrJoMYuMGB2tkUbsooOIKIe04JBo3T4HmQ2EmKxHQ==;
	5:GP04Tw1ttNGXD65X1GHBoQrOkoeWaRh8PDqCZ/gEBd6b2uSs2g0Leobgg6b0Xoo6dd1MCrpmN0RWLr4c9z18MKMxhhLGpIwG3HzOtSYc1/OBJjnWDFkfbngTqwbxq5ggawPdFMo53WDRYuPO7+jOtXgGwOEz3tr2bE2RMuyN4K0=;
	7:HaUP21VoUkULpb8AODSkOZwGgXsS53/pVNUDQqEetJHFhdATGfTTxf+ARSAKYJnQ+3xp2bdatQq3jB+TZZobJHFabTms7LD9K5xoYW0kvC2fNPNZwjdSEJ0Hwq7r4tz410PYBcn7IZWsnH/JEBzj9A==
x-ms-office365-filtering-correlation-id: 91cd3c22-80b0-4881-6b7c-08d64b4a7b7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0673AFD7F7FA3D37675F89B590DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0673; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0673; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(256004)(81166006)(71200400001)(71190400001)(8676002)(81156014)(316002)(2501003)(305945005)(7736002)(50226002)(110136005)(54906003)(2900100001)(44832011)(486006)(6486002)(8936002)(11346002)(446003)(2906002)(97736004)(476003)(2616005)(6116002)(3846002)(39060400002)(53936002)(4326008)(386003)(52116002)(76176011)(6506007)(26005)(102836004)(478600001)(186003)(72206003)(105586002)(106356001)(99286004)(6512007)(5660300001)(68736007)(118296001)(25786009)(86362001)(36756003)(14454004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0673;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: fbi3jVGav634sL0+kMmcM4uOceTal+pznZ2rLuQhoR+TCxd77vKa4fwNY1+pzdYTbng4d4YFJulErFWJw0Hfk7Tx72FnjzQqTnYSV8Qo6p5JPayDZQpmizWH+E6wShuCVqKc/sy+mHWfgv1HDO/hs2zqIYk/7n3VNLLp+ciBGeeOmAe+aIPht5HeBXlDXxc3SMz+musfaKowObT0vDq9WQo0owbqSN7PDV3h8lcum2fdjBU9uqYpotHA5q58SiYV70VbXKJtNXRLDddjRfXMdNgPLCJ1sZvJgyjOw+cRYx5vnSs5txHAOzTaD7B4gom/8dCMb7qMwka+62uE1oDefKQ5H1ynrHyzpUNGOb5b4zs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cd3c22-80b0-4881-6b7c-08d64b4a7b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:19.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 03/23] linux-user: Add host dependency for
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 linux-user/host/riscv64/hostdep.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 linux-user/host/riscv64/hostdep.h

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


