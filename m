Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQlU-0007sU-C8
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:46:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlN-0007pg-Lo
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:46:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlL-0000Om-PC
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:46:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:19430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlD-0000Ll-AF; Fri, 07 Dec 2018 19:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544229998; x=1575765998;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mF4O0+bfADNh8fzyDt27zpjmLYs6qg05LJuV8MMK3Jo=;
	b=RtqZMLE6az9Wv+G3mmoeU2i9lufI8FgzzNNB+t9sWQv18IqhfoKA/wrL
	Jlgw3uqC0AZhsJv10bo7tVb0jioftGD1S3xx2/Svj5TntoOw3oHdDedRn
	ivd8Fh419fDR1OE/QYT9tdpiB+CyhOYpW4AX5I4yj6g2oh4Lx43gbstkj
	Hq5fxeYOtapWIVcvxffF4EgMZcl1HxlWG06mBMlyXQigLXsSZcWtEz5sM
	0C498SjSd0EDkBK+YxO1C3JxFtGoCBMxlcnusebUOfiKTnsvjDoVLLOdW
	z+EVih/OfJCB6NfWSekfkMPACMVcL89/VKwklsQJWHIIqretO5GyTFLe3 A==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="194003364"
Received: from mail-sn1nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.57])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:46:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pjqulYK6IymM7ZlRic1bd6OprINR9qsdhN20yySqNEE=;
	b=OleTcqM7RjJbo3IKQ3HTzd0ipwniRPMGsPXcLPlOcGFAQjta7QtUp2cblxvnVGl+ZnJ/A9WZ19MEu6lTuhFw7Yp7ayrtZ2Sa/t1ptT1zeposzo4cS1Ng+oAQF9i5q7AjjeM9gGVG5U8b/EnqFga5/NrMwVOoUlugPeve376IKRw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:46:20 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:46:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 01/24] elf.h: Add the RISCV ELF magic numbers
Thread-Index: AQHUjo9vHTU4/v9CL0a02CoiFIHEyg==
Date: Sat, 8 Dec 2018 00:46:20 +0000
Message-ID: <2fa0bfa036354699eb80cb431fc04e44b699f476.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:s/24jQQ4KXP9nd7OxYEQ1p1YOyel15Ty4d9BzWObYDHAxdyugyLmRDeO6Zqeh12MI1IoFtmh4JDaDnySP7Jmb2btX/SH1ewC65nXeSOWkoK9YZYg/T2SoP8SCMnag20fajNCBs7e3UogPCzZuEv13gE0mm2HU8RQbhJs8AKjmfSR9T3mFe4YDdZwPrHh8DIUs8StEYrQoxHb7Ig4FRmXJQGDzQarMcZl8led9naLsdPcWUNeDmF+i/oLttXp9qa1FDeNyPL/r3fe6quuEx3olc0ddy5g7Y1jriRw06ZNgmnP5YsJLSiR20YRePYc9ueyno4FStdtJZu9WFv7El9zaFHKVVu5QQOrzenZZSLv1JP0HmFa38byjhmldDYYoNIwgv21VLUFpGysMlzK531VfpdeqIQlTKHmCghjspNUlQER8qHowBmmVnTFRjLJw2RrYMD5qchxszwcb3KpYvEfdQ==;
	5:WlIWJAuK4X6yFcEBg4tLrVYPF7VaGA7kUG1/j528+R0E3Is9bcubyrS7Gddz4q7Vd/MLIrmsd6riPaEJu3qKmPQufhy9TuQ6eTT+ClY4FwGHOsfUWHJyGkvGBPN5a7LWRPbWnb3pnPRUntEd9p2D/7SDe3o2u0gyjhQZRM8CRNw=;
	7:HdteyUHmqpg4+dr0DnIj5DB05bH8lVtaWIoGVYKvjj36E9tlMJCndF8uSLCKg8X47MfInQSomhpvYQCoKDDSzrvVZD0bt5GHHU2N+czLqy4RWasc9m3629kZq+1WJLAXL0+Ue9arUymVhapSvvg19A==
x-ms-office365-filtering-correlation-id: 47a91fef-b7ee-4c29-f29c-08d65ca691f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB3725730758802919122D48A590AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(575784001)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(217873002)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: BcPYidjgWoLuGWiwu++Qn1lZIS1hymN+Dc09FoqEngwa/jpJfQHouiT7PAsFkZ0di2llGbP4lpFL9N23yMXlTXgvO7uWv3mFsdsR8SrnFzS9i3/KP0umvZOhcSR8UiIzsRHeTljU+eD7G1UrmDnVqz46/Hq9yaxpVLYPrloIq9TzR6/OdXKUqyFjJWnU646GXH5gD72VMRaxmQBs+7x+gCIoobPHc89zx6Ldi2L1wJwvOmmsxBaskCLaOwS3tHCC50v6Cq46yoi2tpxYQCIrMR2aYMCvCYRb5xnL2Egwd8CtXZmXuRNsZp4J5grOxTZhTt5FcBUpxnpA2nqpTayjxPmwrEcG7BME8o31ax98VGs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a91fef-b7ee-4c29-f29c-08d65ca691f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:46:20.4501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v3 01/24] elf.h: Add the RISCV ELF magic numbers
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
X-List-Received-Date: Sat, 08 Dec 2018 00:46:39 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index c151164b63..0ac7911b7b 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1338,6 +1338,61 @@ typedef struct {
 #define R_IA64_DTPREL64LSB	0xb7	/* @dtprel(sym + add), data8 LSB */
 #define R_IA64_LTOFF_DTPREL22	0xba	/* @ltoff(@dtprel(s+a)), imm22 */
=20
+/* RISC-V relocations.  */
+#define R_RISCV_NONE          0
+#define R_RISCV_32            1
+#define R_RISCV_64            2
+#define R_RISCV_RELATIVE      3
+#define R_RISCV_COPY          4
+#define R_RISCV_JUMP_SLOT     5
+#define R_RISCV_TLS_DTPMOD32  6
+#define R_RISCV_TLS_DTPMOD64  7
+#define R_RISCV_TLS_DTPREL32  8
+#define R_RISCV_TLS_DTPREL64  9
+#define R_RISCV_TLS_TPREL32   10
+#define R_RISCV_TLS_TPREL64   11
+#define R_RISCV_BRANCH        16
+#define R_RISCV_JAL           17
+#define R_RISCV_CALL          18
+#define R_RISCV_CALL_PLT      19
+#define R_RISCV_GOT_HI20      20
+#define R_RISCV_TLS_GOT_HI20  21
+#define R_RISCV_TLS_GD_HI20   22
+#define R_RISCV_PCREL_HI20    23
+#define R_RISCV_PCREL_LO12_I  24
+#define R_RISCV_PCREL_LO12_S  25
+#define R_RISCV_HI20          26
+#define R_RISCV_LO12_I        27
+#define R_RISCV_LO12_S        28
+#define R_RISCV_TPREL_HI20    29
+#define R_RISCV_TPREL_LO12_I  30
+#define R_RISCV_TPREL_LO12_S  31
+#define R_RISCV_TPREL_ADD     32
+#define R_RISCV_ADD8          33
+#define R_RISCV_ADD16         34
+#define R_RISCV_ADD32         35
+#define R_RISCV_ADD64         36
+#define R_RISCV_SUB8          37
+#define R_RISCV_SUB16         38
+#define R_RISCV_SUB32         39
+#define R_RISCV_SUB64         40
+#define R_RISCV_GNU_VTINHERIT 41
+#define R_RISCV_GNU_VTENTRY   42
+#define R_RISCV_ALIGN         43
+#define R_RISCV_RVC_BRANCH    44
+#define R_RISCV_RVC_JUMP      45
+#define R_RISCV_RVC_LUI       46
+#define R_RISCV_GPREL_I       47
+#define R_RISCV_GPREL_S       48
+#define R_RISCV_TPREL_I       49
+#define R_RISCV_TPREL_S       50
+#define R_RISCV_RELAX         51
+#define R_RISCV_SUB6          52
+#define R_RISCV_SET6          53
+#define R_RISCV_SET8          54
+#define R_RISCV_SET16         55
+#define R_RISCV_SET32         56
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
--=20
2.19.1


