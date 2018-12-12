Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAPk-0000JT-AX
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPh-0000Gf-MU
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPg-0001MM-Rm
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:21 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29115)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPZ-0001GZ-UX; Wed, 12 Dec 2018 14:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643794; x=1576179794;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=KmIeavw+WzzhQnc7gykgb3xdcOCNu2+aNpQMFu8X2Zo=;
	b=BwsFfWJtO26apcPRV5vavaEvoaVcjnu3htlZGncsK1zRD6Grk9ok94wz
	XQrPyC0ZYP0ySOfyMioEp8lFlivvsPRKnoo9TJbQIvMV73r2zz/ra+ncN
	yHI+EjkHpXFZeikytmPbMpHaEwymlw62a6xkujHk6bv771hSDO803MmlU
	p3326JCKTMOYBTXTdH8l7CXOKVvpJjVckUA3668tX+CVepqxJMbgb+8UY
	Kesue1UAw8dkfsmVYgT50QhABAd3HZn29eJI8jVjx04RNSgrpm2ymBOlD
	7TlWAZZ4HX+rESvOBYnQjvsMG9MM8tVCk6Vl6zPReXF0+CH6ha/fPEvtR A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="96440785"
Received: from mail-by2nam05lp2059.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.59])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:43:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cS9GC/urPKyPsRwTfJuex0tnc9ZTAcu5Q/OUjpNXaFM=;
	b=gsPnGxIIPozKCuT2kYg4m1BzjLYoN1Qnjw1lw9IhGXapUipf8NzhViU10+rcqNwC8XDBFDsbcroj8NPfhUhO8HiZ2Iffe+h5U6SS9VJV7EdpOjO1ukTK7hz8gkW62RJ38dC5gghiLmnk5wZWrKczjLCrZ/+oklmW8rzjIPsxqQQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0784.namprd04.prod.outlook.com (10.172.168.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 12 Dec 2018 19:43:09 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:43:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 02/23] linux-user: Add host dependency for RISC-V
	32-bit
Thread-Index: AQHUklLpJx1rMN2fu0qhV84L6SODfQ==
Date: Wed, 12 Dec 2018 19:43:09 +0000
Message-ID: <f64bce26b2cd7e93658c28fd84cfeb440b0ab375.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0032.namprd04.prod.outlook.com
	(2603:10b6:a03:40::45) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0784;
	6:Zkw2LJuEmmCXCz54OAckHlu7x33hqPMiKg59cO5Oao4iKVVr/C4/P55VAfGY5fpvZKZ7iKhRc6EL0Pe+WzocWsySz7HyvkJBPfGa1cvgKURQDR3pQoS0vfZw14VOCbtMS0sCsiSsnZdKBBubInshA78knOGMn1490S/9DN3ZzrTzCmhtrQp8Q2D60fnTflmO/vU9dkN37Hcb6YWyI3SdIiPaCRIycgscPhBUk9Y/nQxk2b0/PJdpuH1GRigoQMgJHvGvN77J/ppIOLUAWt8o5aOFm/WKWTaHT9DBOIvfwPxo0Bnc86RlfjYOrnHNSrYPMWXZCfGfZn7lxvTFrSUMzKco/5RKqhiPnrNUdhQjeFymfi4xR9nYVX9K8BzvgROO/Dv088Ll+iIvdPLuN+nz8X+CXBA/uaWdOfeMsErPnE81FJ0iLGDo6iKP/hxq0T02bKTnKkBDh0Q6zF10kTeYCQ==;
	5:WEoD9fd67r37K684WgElRuN5M5be8X+pApLPAlE5mM0MnFgBX4iN6XrrYQ3QNfPHQgU5Q9S/O677ufjlyrye8mWWUUw3CMvjhsVXK4/2AUDFSdr3inVqO4bp27ULDXLxi1l/dBvy0GNHyAjBm3Zqj3ZcvqgxGx8kqHBiLQDvSRA=;
	7:YTJ2jzt/2FGbZL5vDFl0eL4/K3Psetvc9tvH4YwnsNrySEeuRKbf54vzdtC89nkXIiwMs0lTX7tQNr0UP4AFiHBwKM/XyAZz9r5iJUatbOP9g6BP+FXX/sx7ek8CgXVp2I5Mc2IgGcwo0UcQOsh/GA==
x-ms-office365-filtering-correlation-id: a23443b6-cb0b-48e2-e4f0-08d6606a0b63
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0784; 
x-ms-traffictypediagnostic: MWHPR04MB0784:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB07844334228D3D29FA0B5D3790A70@MWHPR04MB0784.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0784; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0784; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(7736002)(2906002)(36756003)(5660300001)(81156014)(8676002)(81166006)(106356001)(8936002)(99286004)(305945005)(256004)(71190400001)(68736007)(105586002)(97736004)(71200400001)(86362001)(50226002)(118296001)(2501003)(6486002)(52116002)(44832011)(25786009)(6436002)(53936002)(486006)(386003)(4326008)(6506007)(6116002)(476003)(54906003)(76176011)(39060400002)(11346002)(3846002)(102836004)(2616005)(110136005)(26005)(478600001)(14454004)(446003)(6512007)(66066001)(316002)(186003)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0784;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: i5ow6M7h32QST4YDJv5rac55uqMVlGok+41Q8+MsGqAv5cijMDQxnlUt47O17bX303PEyxRcZmuT5DkqSmQamqBBP8XuypoAMERRCOxlea51RYiRFIASI04CMlXddmwqBBZH3InMdDVpVT0t6DwsCnv92MPZdgcfGGLHS/J1GZE3U/PYjc2O+o0E5PnMxCQgtkxgW+ET5BViFPOAb+T0TUxdCyKoRWvWl1oVcm4eCHrzqHSiJ7ptGt/o09vTnV/AZl7CNPF5+8mBLJGzRglLxl6Y3diBdel47RwgaKiIq83nVy4t4RtfqxupSOCSM5vS
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23443b6-cb0b-48e2-e4f0-08d6606a0b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:43:09.5899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 02/23] linux-user: Add host dependency for
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:22 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                       |  1 +
 linux-user/host/riscv32/hostdep.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 linux-user/host/riscv32/hostdep.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 63effdc473..97071bcdf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,7 @@ S: Maintained
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


