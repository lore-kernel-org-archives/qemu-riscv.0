Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkZR-000304-5r
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:07:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZL-0002xE-AC
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZK-0003a0-Iw
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:06:55 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22155)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZG-0003Xy-6F; Tue, 27 Nov 2018 16:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352811; x=1574888811;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mF4O0+bfADNh8fzyDt27zpjmLYs6qg05LJuV8MMK3Jo=;
	b=n3M81PSa0PdDtzirfIiwBoECt60Ua7sQFLuU0uGdF2ZuAh1mvFwNnECj
	R4NTnnEfZ1L1GmDLqW0rPk5rPesl3Dg2QFFwc3MAdhL/Hb1oK2ShGctuy
	wtjlQoJXN0IIDxsdW2F/ON9cwyIeWIrbwdBDGWn1Wf2S0VyqrcpZvsoMx
	n3t/khrr+UnPQCNrrh4bspQfFf8tTPO7Udi3W6PCyGTogNJhIp/3xZ3+x
	8wG44unguRyEEBYZFGnSuVYWTaUoCE/P/Lt8eQh/5GrniFaUthr3Qrpbp
	FoimHF+XeGo2Bz/GgREPu5ZqC14J4Qvg2+WTs6v/C6FWwD8v4xLFfpLHl w==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="96433549"
Received: from mail-sn1nam04lp0087.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.87])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:06:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pjqulYK6IymM7ZlRic1bd6OprINR9qsdhN20yySqNEE=;
	b=EaZGw4deS5CnBw4vx0tn0n86CwDZnZpXwautlJJltlc40RGb+lzPI6RjxnmYwyMHEdUo4ZN09uMyllZCtR40yFsUAc0gOatpRFhu3CE5PxMi7I9Wrxnk0aSTS7xcL8TUdRBqlQD1G8Lb6lhO2poJhq1O7HyJwJ/JdZ4nl1gs/9w=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:06:45 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:06:45 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 01/24] elf.h: Add the RISCV ELF magic numbers
Thread-Index: AQHUhpUaPn1fUwK+HUqXbGkEA5TunA==
Date: Tue, 27 Nov 2018 21:06:45 +0000
Message-ID: <29787dcf10591f4f1dfc637ea61634dec7b6d260.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0081.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::22) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:kkQm06MwSO228RdB7s+o7ECO26v87ZRk8mL2+BobUFcTLniDeYUBEjlPh08xNUD36VStuJeJzKHFrBkpDiUcqMJ16CSg6A2xZAbcwhf0eWryk+K+OKwcajiAfuD4Bi3Lu3SHxIJ9zdANgsUtIraXQX/NHuvEA1pHZl9bJLunJOCEEZrjDg7Ar51VzP8VX+tEos00t6jlhgXuZXQkPKmKUf21UO/5rcGmfwsEeIZDMT7cLKuSTbJE2TNc94kgpPFcgEQXAGS6hXGQ22qyvEnFqi2BR/Mc/7IhvYooO+KNLUuuk3CBv4XFiAfD3HE/k7MXvY3hH9Uv3k/rGlFwhLPWq1Fd9ScAS4KfqeDe7BEqYFRnuz0hOzMJ6M298aNBWml6hA1bPH9cfEpQV3lpVcPl7dSTrI6OBbQOy19Oqwhd0QLSmd+G2o7oALtOQQjybRESA5jT9v9CQ3m/3HC/rTUH2g==;
	5:yz7se4vE5UqEQZVPyiGKTSOK08iaijjpRUn6KuyuZUQwxsdhGLNDXxzEcJf5ybVNC7dloWXcFj7drsB8JovzjEcckmRnZK/e9DfHmtTLHOgdQuHQiemkdhiI/dQuVyAyGuih/a+pwDsYvmndvm3g5aCbEZqnaSN3q4xRIH4l0Oo=;
	7:J+9ZuszkvZppHcTWSXBMrPDRtmdrCuodY0E0HOcamubfQo54SKIzvmlxVwNS1ha/H13k9X8ht/YV/rJaAsV3mUrIUoZAYaB3O3w1t3e4LwSq16dm/PyHfCCtYnK5IihjpzZMsYuux3UOux+fI0lpXQ==
x-ms-office365-filtering-correlation-id: 5c0a4faf-d030-4455-e64c-08d654ac3cb2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0943762FB4BE6523CE2B4D8D90D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(217873002)(7736002)(305945005)(118296001)(575784001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: frflz+KvXSGClKPW5dURCqWzNWRav7Ekh8ZSUZHrL2trqxx042gdPdrz0Cno7lbunpRGOS+aCARzYRj/eONwqYneVIRLMGrgIEPV9GA/GS1zATclHf+Pt286VJAeI8HbfHthdLkYApnCTbA3fBAuSkmgRVweH+HzyZQ1Qg8cBahU5VzVz3HIZlVUehEIkw4FTnPx+JNKOzRgYHBMeHQIYyXAcBQNW2oo2SzEQPwWLh4g0KC6r2yabKzHz+xdOA1GfrsVK0/RFOIabjLsjfmdtx7WXgrrdaB/ppBRGNDsXXA6Dwvv+L0OB0N4Tp72dOEoOSs+t7P+cCtAlzGvzZh0vAPWCcdxg5ctDITcU7E67ZI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0a4faf-d030-4455-e64c-08d654ac3cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:06:45.1938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v2 01/24] elf.h: Add the RISCV ELF magic numbers
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
X-List-Received-Date: Tue, 27 Nov 2018 21:06:56 -0000

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


