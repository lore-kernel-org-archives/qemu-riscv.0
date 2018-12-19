Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhL8-0000vR-Gn
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:17:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhL2-0000sm-ML
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhL1-0008Ev-Sn
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29163)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKv-0008CX-FM; Wed, 19 Dec 2018 14:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247014; x=1576783014;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mF4O0+bfADNh8fzyDt27zpjmLYs6qg05LJuV8MMK3Jo=;
	b=dmv0nkhBYcrRw0s4dK+c/7m2XEm23VxoLD9zfskTPZJe5w71OuDxxInM
	z165K/HUOd30DlxIPnwWGfOqTUcpRa01uro6o5zRiARWqcDArcdhYUbGE
	NwEjvK1bCtAaSEH8a34XzlK2doCLwGvYtH3Qsq00E2Dx1JnApjepB3g4k
	bHMaAmUyA3gRgnbuP4wJY4YDz9k9eggUmRg4V0rUpl+ZMmzgC6XwdE7KG
	pwbXlrtd1/ZwNOrcBr24ZZfvCRKNVoVetYGGxqcoaSTI7OynMKIIIDaox
	Z6tLy2gVCnWex/4glCq18JS8SCfDOYRipp6gtl3y0wNu8dLRk6/UNpNO9 g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="97003944"
Received: from mail-dm3nam03lp2054.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.54])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:16:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pjqulYK6IymM7ZlRic1bd6OprINR9qsdhN20yySqNEE=;
	b=CIpiv3guRh7lHk2+CrNy11ldMbk8Ixt8dkQbr7qs5/7ursu2juuJJIIwsqhHP9Pj6H9H2pmPofVb4tztNeLbcucT9MuyiG67I6ZVl1FSZT9CMvhCfMYnfD7IwNhH65VH1Sl4it0xfQ3LfZeeEkzSg1U6xw2i4Aaps2ZERFs5xgk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:16:22 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:16:22 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 01/23] elf.h: Add the RISCV ELF magic numbers
Thread-Index: AQHUl89Trg8LjQFUAkiS2dtJaJoUPQ==
Date: Wed, 19 Dec 2018 19:16:22 +0000
Message-ID: <02fc0b3a733f5f08eb396bee5afd3d327941f0c9.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0020.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::33) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:jllSq9IZO/whWTtOMY/h89LHwldvDoZyaVNvJrwuQdnstLp42qzCB2lCJaMpgvrOTH6i2CSJkt1cjEF4rt3dvRrL/llgj0l721+2zjBkwp/uFsaaeEgTYn93CRj2lgTgE54KwHfLDL94W4hdxI6Din3vmh7Rdj/F0R6rTKlMRjeqNvX1tiW5PPAyfIOw57aptRyBrDwxOLtxI4nzEneY2+m8JWYRFeRLatgwbJCUnVmYSdXFalkGRQCWqL4Aw/eoVG8J37PS6JrXBjElC1D7tLKLj97Yp/ROV5u9fYofoGd3myzwoKJC+sjo9eiEXkUD9XvAWUTpboFiWsG+Rs6dv0lklrz9lSYtsJfY71JBMgJXoL67XWo4ZUKmQsMFeuMgwoEizr/KSSUv0odmDOj4887MPwEMPN7J8+xCfV5EzWU2MvOODJZ0dfWCupFswE/uRZqMRwPo54mwCm2/60IqFQ==;
	5:4cM/kUXcjmbb4nFrvT4f2QHB/IngqtaKe0LhlOVQvgSqq7trqlAdYQ2vBaaKdPQdeutsNU34KbivkfKhFKU56tpPe5DM6Zq4i2tdUFPaR3l0MSM7EKc5ICNdq8STejaqBv5W2JRHg9q9JgG5lyxYD/vW3PH/vd+7WeTQWtPZjjE=;
	7:NvSIi4ibNLkZEEbxrZUUKUIpuqTBIlmMR4XJif13dHJ91iRhhSMSKXdj8sp30wMOGeki6fLz4EYauh5KLQolO1lZ0eQNiEWj6RXHif1x4whSDD8YHCq3IR+kim/rQK0s12DWPGnUKZtFnRCkaySU0w==
x-ms-office365-filtering-correlation-id: 634e7445-cf7f-441b-b73a-08d665e67629
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB02713BA4D9550C47B868C4F890BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(217873002)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(575784001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: pf+NXDGAIsguDYubIwKLFfrqsOqxrrKL93iEmrZhL+7ODJ9dHMYOHCkYU/AWK/XLvepehdLRH0BSbyqth4wsm6YwjDjCqtIE+tv4vtIvi+QFP2kThMauPxoUpFdycp9h3VsNN2B8Zlqcr+Jbd8nkjFsAQw9zME6b/Ya7i/5o1Oi3BFwQ3G/X1Ng+v66BnU3SA8wG3c5UIO9MBfSnNcBejxGjx4McsHpFSzeVw2msjSoGo93Vy1QTVMTQ1AOy+GcjKG+1pWmls9Yu2AQim+L4VFBP3QfNWadgjzRK4cTD2WmoNy7UuzBFfrOpocrs7Z2M
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634e7445-cf7f-441b-b73a-08d665e67629
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:16:22.0924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v2 01/23] elf.h: Add the RISCV ELF magic numbers
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
X-List-Received-Date: Wed, 19 Dec 2018 19:17:03 -0000

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


