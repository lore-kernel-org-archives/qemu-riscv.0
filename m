Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkb0-0005KC-QY
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkay-0005Hf-8V
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkax-0004Wd-FH
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:36 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36157)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaq-0004IC-NA; Tue, 27 Nov 2018 16:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352908; x=1574888908;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=kWzsfn7e42RqPjkeVspLL5gBVbw9RfDVIbRNtvkFikg=;
	b=aQ9zxxRMok8TzOEWbjJj7Ne2E6+xjGz4z+xxBu0jVKgv6JjPOKpHgvig
	wReBYGCOjedgnckEwKRWSmthCFOWmIAP7MEjnhc5HXcFs1yLWsr48hrct
	K4dFgAmYUG+9XJ5NZswiZMlsJW+Rvle7myBz7qvcQo10CCBy610fZ0qUs
	eaqIMcVlthfUkPnYc4GyorRCHRgmkrZyHpbIEgo8+Timi8NIFXVL8d3sN
	T560/dC3M2cxmFeJ+Z3siAhwkwboA/FdbuJI3FSGO1C+/0C+Z6nXf+Q29
	9xHWIR8DglqraPfuYwhozokO57TxjV4v/QZiYFzNgol/9fW9UH7X/a38j w==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064239"
Received: from mail-sn1nam01lp0111.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([207.46.163.111])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:08:27 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qPCEwl0VpsZF0JfYNkMNtX518Kw1GdKBdU9uLOOPO2o=;
	b=TSjcppTT2b0RLNY7BzdDFaGFpuA7z5+kxoAvxEOLkGNumJo7+nhBXhBW0ZbyoE7DAo9YY13BP2r1cQDdecYIR/+pqu2FB5WRhTYC8S02r8Xlxm8sU+WwedscnhOOjvUaif54RVyMOd3Ou6u3KzEZveKsU45Fyc+s3GMXI/ujwEw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0993.namprd04.prod.outlook.com (10.174.250.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.14; Tue, 27 Nov 2018 21:08:25 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:08:25 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 12/24] riscv: tcg-target: Add the extract instructions
Thread-Index: AQHUhpVWuHl43aL1XU2YEtdPFb5dhw==
Date: Tue, 27 Nov 2018 21:08:25 +0000
Message-ID: <d2feed138c5a4078adf5a6f6bfdadb2765fd335c.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0021.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::34) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0993;
	6:bk0bk+1XCNn3uMGiEi1GxK61c9+D5UK/MM8DJIUq9SKO5+w8RXAF1XQKDYAHqF/GZKXlZcfCihot573XkR5pXZHYfAARK9NdUH59KoUSVxeok21RKpXuVD7phsSzIoZ8zkgVn5wzTV3YETuL6hwkzmGCD/CN55UzEuGjgbsqPJETENKtkGHtgtAWslafpHlWfKLQuzIM3aDOYgKwpMl+bAb0LNLuCyVHB6TcPlXZVdTxRcnG8mE9IkSwO84S/ChF1OjggQoXMP72Z8p9Y1gp9dtvh9mlPl8qMp9xd1H/RaxH7/dvdQpgdYoO80V1PQRgwxCM0sxNh0btqg35yspDM8GGVMAO7eLD8N7CowL7CaMvzgeqznnPOOLsuY5+gT+GQ2F26MabXdug1HXfxoZ07VLMfv8B1kCGBmeSWASeC690y/ZjO7ocIYBf1tKuPK8m62xYVXUIjLSizUFzsKN8bA==;
	5:wsxquLjGr81oahtdyTXYasjv+Ni9QBMhEYT2lxdqvfCM5fHl/niKKk4ehUDrixbpNUpHh0kkM71OYgzhfHTGJvNsntPlQZcroYvG+bEWEvGQMhgVhz9/XdScFQ6PFt2PdIivIsRAiT5u6P4ariFe0UviQWqe96HYw8mKmBHvyUg=;
	7:EJg2q13GucFXV8iWN/UqMSGNXzEV8kD8bRdDZQHsXx9UJKK/ey7j/x9sLTlMEzJzs7pR0pz9ag0WWp4rw5GsO0lNVEech5H2S0F7kdypX848mEodTAia24nbGRHdfBgQvuDt6zEt9sjMfj6DAfmkwA==
x-ms-office365-filtering-correlation-id: 709bca48-e944-40b7-eb5b-08d654ac7897
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0993; 
x-ms-traffictypediagnostic: MWHPR04MB0993:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09933910C2D6F009412B3D3C90D00@MWHPR04MB0993.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0993; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0993; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(7736002)(97736004)(305945005)(54906003)(316002)(110136005)(8676002)(50226002)(3846002)(6116002)(81166006)(81156014)(8936002)(6512007)(478600001)(39060400002)(6436002)(72206003)(6486002)(53936002)(105586002)(25786009)(118296001)(106356001)(2501003)(5660300001)(66066001)(4326008)(76176011)(68736007)(486006)(6506007)(476003)(99286004)(386003)(44832011)(26005)(11346002)(446003)(2616005)(14454004)(2906002)(86362001)(186003)(256004)(52116002)(71200400001)(36756003)(71190400001)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0993;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: N7WYKcKoVo2m2aEjRKXyeQUUwa/WfUDrRB9/pU+FM+H2IjjG1DSU+JjVBI9jsBgTtaNrE0/pke43mpBbrK/ekmrPvafo4MW05ZOrQ2TL5IRh7nUv+zCkiNtx+PFeBjoCo30kCd5GrOUrnCfcDbYoHiOUocBS4c9IllBSM+9hWWH4iw/ICNWvvBavrDrEqkMAjoAv68qpIJ+BsXzuXjHnn2hJolOmVOT8nspwnzE/Ty3npWvoU0swBmkqUY/2PBHI5bC0z2Si0iKngURFqw+Ap2HIe3tQf3uE61Fld6OdawzmrC3ySJA0FnMRv/fDlWbEIjtJ2EPVbKca6TaSkSYVuYAnnVJzsXZ+cHxhcf0mdkc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709bca48-e944-40b7-eb5b-08d654ac7897
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:08:25.6177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0993
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 12/24] riscv: tcg-target: Add the extract
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:37 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index e5a07b146f..4291a00962 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -512,6 +512,40 @@ static void tcg_out_movi(TCGContext *s, TCGType type, =
TCGReg rd,
     }
 }
=20
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 16);
+    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, TCG_TARGET_REG_BITS - 16);
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
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 8);
+    tcg_out_opc_imm(s, OPC_SRAI, ret, ret, TCG_TARGET_REG_BITS - 8);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 16);
+    tcg_out_opc_imm(s, OPC_SRAI, ret, ret, TCG_TARGET_REG_BITS - 16);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


