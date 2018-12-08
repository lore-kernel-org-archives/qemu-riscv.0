Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQnM-0002ta-H9
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:48:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQnE-0002hA-T3
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQnB-0000yX-BA
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:28 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQn3-0000x0-2M; Fri, 07 Dec 2018 19:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230098; x=1575766098;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=x2ZQ7EmMntfJcxRVJOPs8IOwZIsP2DfoYvC20nEU9O0=;
	b=MFnFUP+rgmVEdY+6zl/MVG1JAcx215bOy4SlVFs+qPOKJzGThOXSlNR+
	LduIhrdQO6IjIE+T6PK0SOTTC2aAu1v5RNTYPDXe7XlWIS6WyfAfhYp8b
	y2ZhGzGOQOF0UDCRU+rVefLB05fzqJlPQ9sJoWw6B9miSc/sDg8lnw7Oe
	yKyqkJFY5+0b4QPxTDb/i7nOi2ihH/9uO9g8vJaMZW/v7VyFF0OTvQd+f
	g80XsQ6ZakO3TUFIRsZ/6Jykwx8BXH5VKmjo2InTGzmbDaSQez1/UC8Pe
	ktt6l5kVyN0rQ3FvURYxWkPbXEpYr7htBllN0sjHym5VfRhqcaaM8qty6 Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="97343810"
Received: from mail-sn1nam01lp2057.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.57])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:48:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Pj7X/a+xt3zQpAyRQir0j9okfmvyMvTWCM/uOWt8EgA=;
	b=Ixq0V2ZZ/y9zghGRGwMHpmAbmoKUj0M3Yybxf02ute6KZ9YNQb2V1uC7B9SPaCCHQN686IyA/bhLZ+uUWwtWU+swrEsCR7Pns8BXiw1BgNprNwC8qO35hQDZgkzKKzWI5p/LCe0F1NrIkSvZ8gH2wmug3Mc+G9ky3GuVwQ5vmI8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0304.namprd04.prod.outlook.com (10.169.202.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.20; Sat, 8 Dec 2018 00:48:14 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:48:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 13/24] riscv: tcg-target: Add the extract instructions
Thread-Index: AQHUjo+zTvY9loeM5EGr/NxoxygpUg==
Date: Sat, 8 Dec 2018 00:48:14 +0000
Message-ID: <eb9718835d2cb92169d55f4349aa775082800ba4.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0091.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::32) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0304;
	6:3f/XOWDzX3N4EwflrF3dnodQ1vrfK4WD3vgWTe/n5Ovg9NIROBZ+63jY/M6z2jcEPEkGksPmrdORhSkyLycd2ff+mQ2ARsK+zkWMxFFfvNcvBXzqXrBq5cIaXzw1r0fk+4OFiAw1J6lCHVBtCR1H7MalqM/NOrY8cbE2hZXvoqhBtMZmhLZ2ZJiCf7Jq2V446Bo63WUJggdT4kSE8lm4ktGjmlicpbEXrVvJqCLvnsiod3EPxDUNkbLBcBLioMntGyUT3RPbOXAxrBpd2F4VIW6YarLqaB9tCbanxWZd8OLNJ5l77qrX0yBsJ111bhzuYDki+7i9xly7PpQav6qtYzcnEiYyMxhk9/kLqagultevZ7nH6FDTHdqQ5A5FBVA8prJAaM60JDsuUujT44HJG1370BOjYavELWkivYt9+o/sMSxSFhSRENdXfmcdNcQN8Q7KnaQhDYtq7iTk1KKpVA==;
	5:wFx0KTt8VvaGlQ4r9pPyqkGrxaL09XeuR403rqM/AijBL0ZiWQx9hpvQg5s9zUW9xlHM7OVq2+dIajNILuemkl+NShjIhHqOEKSULI91c2j1ba1iQCzrZP2WK3gPjsNbDYEu3Bmczf7ktM5jpWl0p3P1/lElPNVldrDxAjx5DyQ=;
	7:VHeNhIkNurDTxE+mJwhtsKyVPQC8vKKD9f/MLvhTVV9dNFh1dMb8owCgp1ph+qsRShMPbdNfvRDD02kjChg3dEyyNFj3/RZabXlllWAQ/l5/N2SabLb1Qfpa2k0l9/tQwplx41dAyQJWvn7GIsZRnQ==
x-ms-office365-filtering-correlation-id: c5ce521a-a627-4f8e-a64f-08d65ca6d5b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0304; 
x-ms-traffictypediagnostic: MWHPR04MB0304:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB030405C5F397B605FEB53F5D90AB0@MWHPR04MB0304.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0304; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0304; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(54906003)(110136005)(44832011)(386003)(6506007)(5660300001)(68736007)(2906002)(71190400001)(25786009)(71200400001)(86362001)(316002)(99286004)(14454004)(66066001)(102836004)(2501003)(6512007)(53936002)(4326008)(11346002)(6116002)(478600001)(81166006)(81156014)(3846002)(72206003)(8936002)(105586002)(256004)(118296001)(106356001)(39060400002)(446003)(6436002)(36756003)(6486002)(486006)(76176011)(186003)(2616005)(305945005)(26005)(97736004)(52116002)(476003)(50226002)(7736002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0304;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: qayzVF6A8mCAZdtOutdJFFix7ytszn4SyGCFfwmx1BQMtywuNKkVuMQDO9obR2Tp8RqDfcnf8u3XqFE761UJ6J1yqEFeVo0qW4OyjRY5S7T+dITAX9dqM/5ZBsLue7G3TB6U4ffcvAUAhBM4+hYEhLFERQ1vSJy66TCQ43NZQdBeLasVr4yG6Q95+7VFmdwDxhtY2RTUiZU1Ho04CyFZRvMmMD/5JpR/1B+MzHWWk13IAxnAS3hHCIg+RyAOnvCGLPN7PYWl1xOCZcxH2YMfRBjtmxVljlBCnCE7g4ajMMjLnl8+u3khLVP3bPWIbBeGb3lpygy3JlsMxa2/d9K2AwlfHIp7Rj/HZrw4PRMCJio=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ce521a-a627-4f8e-a64f-08d65ca6d5b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:48:14.1449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0304
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v3 13/24] riscv: tcg-target: Add the extract
 instructions
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
X-List-Received-Date: Sat, 08 Dec 2018 00:48:34 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 29275d6ac9..b7de24e5c8 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -582,3 +582,37 @@ static void tcg_out_movi(TCGContext *s, TCGType type, =
TCGReg rd,
     tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
+
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+    tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
+}
+
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
+    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
+}
+
+static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
+    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
+}
--=20
2.19.1


