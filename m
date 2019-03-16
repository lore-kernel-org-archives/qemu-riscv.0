Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6l-0004NV-EV
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6a-00047y-HX
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0A-0006Bs-Hv
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:43 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:25828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y08-00068h-2L; Fri, 15 Mar 2019 21:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699240; x=1584235240;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=JXmH4WrHDfrOrotNzbCjUCXX6a+ubhrW+bSu/dDt/hw=;
	b=RDS4B5lNbPaKRqNwyZh7hepu1Bxx5P0iM5JmsSNNUzkFNJHmo4x5AxvW
	WGCoGuMzECrA4o+yvTOaAhPCsBj8eeZtCtb/LNCrCvGG5nMTtq/HhjrqI
	pn69TBJQQd1KeYrxwDFMi3EwQTQl6XnRDqv50LsdsB62AvK7DhA0U5wcN
	PqMXvc3Br8OCJS1yJ9Y3Mot7r1PqaSHGPVfn6BuG8pjrocAOCXtus5HMe
	yT6QKoTTEWyRXdFjMqKGDHCwrVguPEk363HdxaCB1dNVRNZLUgPRlAJCy
	pfIgp2HrqG8HvqkR0B+uzB54iQypBO1HGhXTZFw9wpxwXCYuHm8HOR8Ky Q==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="108600693"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/pbA4nh3Bd71LPT5CgV1E8ywTrLsYGuoghBV3cWNH1c=;
	b=NOCrqfBOgzQnAoF8I9Ma+eHoOvwctAET90JdJ+d238sfQJRZ5TFzSIY1JAddPVvdwxZVDvKUjJdHc4G/eFoDWi7UEMy8bGGMteP2vujJddIDwlC+BqrHhjLjGFsidODzuq/HBAI6P4PaxdAlSuW5ou7mCCo6K8IiM3pRCigIlpE=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:37 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:37 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 05/12] elf: Add RISC-V PSABI ELF header defines
Thread-Index: AQHU25Z2/FvPVhu8GEKeNT2eVxC5dQ==
Date: Sat, 16 Mar 2019 01:20:37 +0000
Message-ID: <1cd1d02f1ea1bbedc97ee7d764c4a6c32791024f.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0106.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::47) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 576e6c6c-1e7e-47f3-37ac-08d6a9ad9880
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5989B0E81D8B18B25D2874D790450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(6306002)(53936002)(68736007)(446003)(4744005)(966005)(14454004)(72206003)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vCUiJG7LyoPkL9G6QOyMtTtnygUZhLMI7dyewzvZ+c6R6cy9wtth/5DQS3lkTLkUpMj4bGhTLNcmHMMyGM4YdZg59nwf1BBxOEQddtZLn59vcP2O7qRXQxxdwSH/3yGD42JhCNGlm3Gztf6UcEU1raOwNCoiA6fruvakdp38KMoV9H0fpmTT0n1BoOYIOxMK4DpiGG56xFWkX1HkmmnuUEnVBE94gSefAjz5yS09qCz7kxrVnw1zkwDxwHBlwQfcUSMYsxwsQrD7lbUpPizbLZWXvnqsaTBRbd4BpJsz2cI4OyhZP6GlrdQplFe3OSRJ5LSOK2NJIkAVKbdvP9zZF5VoygocPOnJyV+p/y0OJaNrHxhfyS+fiRiJlsHJNtDWFNih2Qr6FCjlr75N9B1qVAkp3SynsRwPXEuIs5bVdqA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576e6c6c-1e7e-47f3-37ac-08d6a9ad9880
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:37.4201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 05/12] elf: Add RISC-V PSABI ELF header
 defines
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:24 -0000

From: Michael Clark <mjc@sifive.com>

Refer to the RISC-V PSABI specification for details:

- https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/elf.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index b35347eee7..ea7708a4ea 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1393,6 +1393,16 @@ typedef struct {
 #define R_RISCV_SET16         55
 #define R_RISCV_SET32         56
=20
+/* RISC-V ELF Flags.  */
+#define EF_RISCV_RVC              0x0001
+#define EF_RISCV_FLOAT_ABI        0x0006
+#define EF_RISCV_FLOAT_ABI_SOFT   0x0000
+#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
+#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
+#define EF_RISCV_FLOAT_ABI_QUAD   0x0006
+#define EF_RISCV_RVE              0x0008
+#define EF_RISCV_TSO              0x0010
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
--=20
2.21.0


