Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQDW-0005Tj-OD
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDR-0005QC-RB
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDL-0003VG-QF
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:21 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50484)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDF-0003Si-2o; Thu, 15 Nov 2018 17:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321253; x=1573857253;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=EtlsQTNgEZS/hhMmB0E8Eq7wOPJ44rAOJmH814d4WFo=;
	b=T6iPXgXHxWAcPYexsIJLqgUHm9Xh6Z7EwNmUVDu5QMoloyOWxTUA2s5U
	1LBE0o7oxlkHeNKbmpttYk+quFqi1wLdVeO7TzOj7mSTJ0KsqlCsE4aCv
	cqpGxD7xKqaOlQ21BB4maEqGMDRwy5zKflQRi78Yqjhy85l9iMKUyJEw+
	P3odNhcE9R1qH+NXDotI4qybAGvRSoFaTm6zNMpAfpLKDzZEoppIwGRCc
	Cs/gRSzhGZaSBZCseVoE74MtRZAehaFjd/8Uvx408Nj5d2Km0vxoLUuT1
	yqWswcO6H79ENsJ9lGmdW1Me7zErZEKbuw9MNHd1FLY6yli90DvMHyuEr A==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523271"
Received: from mail-bn3nam04lp0112.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.112])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EtlsQTNgEZS/hhMmB0E8Eq7wOPJ44rAOJmH814d4WFo=;
	b=MDsb3BLsa1LvQZ/AIwAmWs8+vmSFu/TU9UhCHoOXTqluPa5ddHmGNgesPJZD2ufnig7isqIlPp2tOGGsDzFKYI53TTeWjRlsbraW+DRo0Vey+ZGZNrNulrWrqiQCZEBzXUiNfvAdOis9fiQ74lLyy1KHgkuxxdKyHE2mx3X1vnU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:34:10 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:10 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 02/23] linux-user: Add host dependency for RISC-V 32-bit
Thread-Index: AQHUfTNT1K9MbvF2EU+5L2mhsvhhQg==
Date: Thu, 15 Nov 2018 22:34:10 +0000
Message-ID: <765fe28a07d96b0fbd642e5d5f01c123118db4f4.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0060.namprd11.prod.outlook.com
	(2603:10b6:a03:80::37) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:RQJrozP2qzyLSdntUAEUPCLj923Me8+AD7AnByb3JwSXri9SSs6j8VsAKmgAgbINTezkTQ+m1l9sBuoRLrqHqZ/bllextQHBaasFP2JwR8zSK6DGSM6K8znRRQtqfktg7u9D1IP+iM0YDK/37uVO3gsPaljaTEFNUbZoYEUfwkARShgEw+kdsqPTy5l1WgZ8dnqUcuwaFP6mq/GMbRdz1416eInvx+8cpD0hHKbmku6tkXzGcFo0ULS4UQsO0BH/Evd3Vu7INZGRnGRzI3D+M9pcgxiWo7uVuBhR7uIeNGhsS2r8DIJC1FTys8wfwp/sJ0OBnWLV5JlPuqTS6o5abJUMMG55PfRAGqeJqLeYv+i31G7pbjOlpA+Dt8kaukZ6+yVewKZ394CO46mzF8psp04DtLdBC4Jc2K2DFiUzAmWxcTUyH3RwSZCrMzBRWSwYkRes+z+bKu3ysrzDAbLQog==;
	5:4VCWkGybLx6UyCY5Phnbt4/Bj5vzIPc6XIo5g2OPTm4dcedv4jhU8DWKb4xxrq25XTINXdby5Cmlf+lud39FJFaW7KwGNRfNaX7As4aBaNCsouKbYkahqP41/0okcSq02pn7ang53vwQPbyRvFDvGJznUQRyFBydhdwvxwn/Hlk=;
	7:ljoVmiK623QEZDxDfUmwkQbJANVqdxYRlWs51xo2mBOeru/3Gr7aRZiMjY7Om5wheNnazeKxuBG/N1SrqidCdNBsxruTLNSDfqXbApPcYiCS/QTqMfGEwQ2wWH4SGO4R5vTsYFaASSUr4rX825TF+A==
x-ms-office365-filtering-correlation-id: 1ef21884-57b8-4e8c-34b9-08d64b4a7607
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0673C352CFF45FBA14642AB690DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: WEnivex60YOLjceJMI5kcylmVNRdVhRhMIKgTvJg1LhNMBSIwcKyLWyroBo9m5r1nHO9qzfceoyM4Zx2wDhG0NPvG1x7iSHOO3Dzr3gx/WbfP+OmDA2mxgIYmL4vYNj1L8l/aT5WtwGddIvvmQVfurITNc/HNPs2B5cdJ9p1XvhTXXBEJt88lztEd2/ARNjw/bN++fHbd9BrfVISQngc2SRC60h6SJ1prASx5DCI+ql6XgYU2LGm+LJgt3ZppefjdIgk2ThgTkgKoh2g3W6xTOCIfJ8Y2EvBK01MrKfFa0gKMZ0/ylvq0JekukFng2k+H1U0foz3rMj45v8/4SY6SD66Vl0lnKsizuV8JgMmOgE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef21884-57b8-4e8c-34b9-08d64b4a7607
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:10.3053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 02/23] linux-user: Add host dependency for
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:29 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 linux-user/host/riscv32/hostdep.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 linux-user/host/riscv32/hostdep.h

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


