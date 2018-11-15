Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQDF-0005Ik-8n
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDD-0005HH-4i
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDC-0003Rr-CW
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:11 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQD5-0003O5-PX; Thu, 15 Nov 2018 17:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321244; x=1573857244;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=PwZxPJD9UejMCEKVCOMM+JvEncUmV7a5caZhNGTj4fM=;
	b=VPRYLPcM6Vn3iNiNcvH03LXHAWDNYYZudAc7cVtkP3h82HsPoM7ke2YN
	1cwNXF1P8fnb5RnKZToLsNnOnil99aD8fieVKFXAa5o0OBvU+xoE9cJlA
	968+7mv+tA3R1JVVeImJIfICta27OhD5hOqf7O7U3GIzSmMoLlMIJkxZw
	j1Wnq424ZcDnefXN/tF2jDKFHO9GLSiTkMnLf+nRGr81Id5fVhidgzYML
	UjXJd/anIacdhG571GC7qi7NA+qao78PVO4nqOJxu9BuoSTKbR+yTo2yF
	XlOBaqlLsF65m6vFlSLs0PBgG+uO9NjElEPiNDm6clW4LhJQG/5RFEQlA w==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="96079232"
Received: from mail-cys01nam02lp0056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.56])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=C33DIgrfUEXmtA63NtUWu+YJX1vfvn8OOwWolmktfzQ=;
	b=ExPAfU4GN+dH01gskRQjXUE2qjs4Gp+bSSBTWCpKH0QDoeK0HWQVCwzRKbkC6PyVBS+tl6gmC/L873n97LuB1d+qy+i7pRtsOQujLrUhsI7XSLac6znUfOJe45+XEmUIKtn23pCBQvkS4vsiCcyEQuhbQhr/00YYsOPb/EYFRiw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:34:00 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:00 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 01/23] elf.h: Add the RISCV ELF magic numbers
Thread-Index: AQHUfTNObs31E0Jdnkef9iAuMiaJ+w==
Date: Thu, 15 Nov 2018 22:34:00 +0000
Message-ID: <35d983dbea36b3d8af70cc0055fc4136b476ace5.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0043.namprd11.prod.outlook.com
	(2603:10b6:a03:80::20) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:9UeATVvNhxdFjlwAoiaNRKRyVTwYRtiNTrQKSpesLi3Q+91T9d42CSSniWtNVaiR8Rq3KHrUGVq83M/+gInSy7g8KPf+vUa+S4VHO6Px2z+WQN52LIH6lPwNakUk7CMUod3JGVP0Gx1IkCeQ4yHpRord/jYaxeMD82h/B8AZlsIh0Stre26N24pM/hmdxxX7OyVaMGd7OXqyY/hyBTX44x0QeeXhzDpb/xnbWYXsEO/s2Wss/H/vArDmSJmBi3HfhZFrFG1yiFSaIWVGIAZ6ga3NUeADkbg8UhgezTgSU/ub8i6N3CdbUe83Gt2U8Bj5TrPJRTylFGSLfamiQ/V3hnkafC3yYs0klznndAQ+ehay+uI/9f7Sp7kQWlYSAPacFMmoHgcTX7+2lC7jNvMQNNcIspaMXQN1XLMBA9ajxLMrxDpZmdG9R4f98a4xufmzPsAO+zBFjhtfX0GHK91VbA==;
	5:OztzPSp9nq5AfFmjCxpjwWaNu1gOCdzV6MNno91lf0N2Cl6ddhtJZlAOwIstOop7laIolThMKjbabKZfcqufK1xdvwUNaeFdha0rgOQweF2cqDoiuXYYMRkYGA6TeUSmTf0ontztvpRd10gGlt3gsFagFwK5baTYZMuuGgi+1PI=;
	7:0k2/Ybr0gNOw4oWvD4/5zh5plkqR8RD9LJldgECiTkeCAcCh3qsFT7vJrorHuhwPsGXDfOcll1UsrbxtX9YUpqrBsvaThZknScocWl3s2FUFsRw4Jml1YM/s+EuVlkJygRT/YHZ8ZpnWZvZ8RQDgMQ==
x-ms-office365-filtering-correlation-id: cc002423-41de-4ac6-7e10-08d64b4a706d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06732FEC717720F65372923490DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0673; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0673; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(217873002)(256004)(81166006)(71200400001)(71190400001)(8676002)(81156014)(316002)(2501003)(305945005)(7736002)(50226002)(110136005)(54906003)(2900100001)(44832011)(486006)(6486002)(8936002)(11346002)(446003)(2906002)(97736004)(476003)(2616005)(6116002)(3846002)(39060400002)(53936002)(4326008)(386003)(52116002)(76176011)(6506007)(26005)(102836004)(478600001)(186003)(72206003)(105586002)(106356001)(99286004)(6512007)(5660300001)(68736007)(118296001)(25786009)(575784001)(86362001)(36756003)(14454004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0673;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: /MpvLB1XBPfaJMQmkNNbPA30UavG9KEY/ent3sAAJZa3iarE8AIdzq4g0C/JSEUarNsT44N+leXxCS6auso349PUq+04Bo7mawrwktylj/+ex7+soSCVktBkg2ZjHuTT3/i1bI6f5s7lkWlpCQ4Ryb/+mcAnEWhgOfrzWavFf412GOlKoYAhnSx9is31biOIr7wonUJe3LV/Ir+IDrF5cm3N9dpXtjGqcLH634Y2Z0ixYhmQUIm4dlCLGPSwoZfQJPvGnMYG/0/v3NsLTXUj800iM1ptow96NXPDeFoL7bbWxyA+oc/BVwKCxU48bDcigJeTJ1uxmMaPQtVYL4kFNgxFj5yvk+NwmInKyknvwYU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc002423-41de-4ac6-7e10-08d64b4a706d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:00.8633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [RFC v1 01/23] elf.h: Add the RISCV ELF magic numbers
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:12 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
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


