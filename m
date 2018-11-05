Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJkso-0006jw-OU
	for mharc-qemu-riscv@gnu.org; Mon, 05 Nov 2018 14:49:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=840391f99=Alistair.Francis@wdc.com>)
	id 1gJksm-0006jm-6B
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 14:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=840391f99=Alistair.Francis@wdc.com>)
	id 1gJksi-0005Pv-0q
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 14:49:56 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7601)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=840391f99=Alistair.Francis@wdc.com>)
	id 1gJknm-0008Pw-DT; Mon, 05 Nov 2018 14:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1541447087; x=1572983087;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=wcCo1w+FOLtY/YdI0yAMAdQeRe4QDWDpCb30Lkzcx9I=;
	b=L3jWPivf/T2oLXPN6kOYoDANWPKQL9DafyLk/i9CxqEfDK+Kbqv8oX86
	ldswTSkiRswBmTmGYTtAQOaElFvM4MQDkcLzUfIUJPPNdJpQf4ZuXnZ+3
	O8JliIiPXVCtibsVJ8CIM9bbxMgToM/Ot59V5ZsRr8xxQUBHFtbwT1DVj
	2OpgRyru5H0SMtj6zmj38mlju4sqIJd5e/EyrgAsHW0h/LONyXxxrENHk
	Rwf9tnEPwvWvqfsyAUp3rkw64BTjxl9mEx3hkTzLRJ6y4MaBnvlo4FVSm
	O6evWlIq1Bp98pKpSvcoaRqClA7+EqVMEgP09C3882ge7RFkhiLvgKI28 Q==;
X-IronPort-AV: E=Sophos;i="5.54,469,1534780800"; d="scan'208";a="98298225"
Received: from mail-by2nam01lp0175.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.175])
	by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2018 03:44:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eG8QjnZy1SlKGbhuHK+mfM/JPgUmjXdkujKEPuWgqs0=;
	b=alNNSCLIJFnKgXTKxPQG6OADYPb/wqqdZLz4tRc1kXa03FCfxVXoVhSjBp7hVp3WupFvGtbPxVwywGU8eAtl9kQNJGPGrD00x9XAGq3IrPeFwcwReTo7NGbfeSCx2sBK8pfMHhERVyt1H+A2J1MJW9C6WFgipWLHOzTLzzrl2Ys=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0176.namprd04.prod.outlook.com (10.169.201.137) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.20; Mon, 5 Nov 2018 19:44:41 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.032;
	Mon, 5 Nov 2018 19:44:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
Thread-Topic: [PATCH v1 1/1] riscv: spike: Fix memory leak in the board init
Thread-Index: AQHUdT/+qr8tNb6Ww0CZXOwi6ierQg==
Date: Mon, 5 Nov 2018 19:44:41 +0000
Message-ID: <3988cd7b9d292017537f75c2eed70295a3a84718.1541447021.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0078.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0176;
	6:my3VCMtkKXXlQ1K8dYm6DDOCQgk095u5FhCSqifswiM0F0XIMGfyWcRu0a9csphN2Py/BA8DmKfcCAJam/+fULGrrGJzsQTQBaNA3VLQLKgooUCBLmdQQjFRMFWqSF696b9PwBAOwE1M3pIfJB5N0L/BCx3q4uYh+1+MdU851gxNRPC1rDIiudvcb2GiImnhBu7poovO4mcZBM4ZA7yAlT3PjqJsLC2Z4TwmLtBPRLrTWrLJeqF69amazCl2GxV/tIdcT7m7YWNk8F7QILBM3gOunYP8FrZKaygoNbHqndidzzyjgBow/NNkAAPJ0Ujrj0EbTq96FKi4pMm7Cmf2JTHQYD4YPtcfLShXKIica0Z4uXkEBuTjgKhszt8qvx5gx80VowsvItWtFeJAL0KMCepaG2T4JADz/MjINjxQP5dM9stJUIzy8IcUbwFOLcg3FfKRGhCEf2qt+38AtDx5Zg==;
	5:Siwy2KP5jKT/ufttWH/yqzkqjoJm11PWo3TggAKtsFjMm+gTsnWB/C1QZRe9TncmiXHoF/ZrM9UdwKtY7UA1I7TrBiuxnptvzFdmXxG/Z5Xa6fiFSwg3zXxxqHKpBQlQ3bJRHL4gC1bwZS7bHjjRZuodlLWoTOyw4zAdQIlUgPE=;
	7:CxU2pEoWqH51gne+SBuoqxeyjVLxFPOguYVqRfx+/Pb/HeX/9aUzQf7AfPItxxHBZK2Z7Vd/tkpIqalOJkS0BgU3GwG99xrKBXOGqfnA3rpMyOyVybFM+VHrnyBZl2W+Hnua39HnSEtmnjVE9E7yCg==
x-ms-office365-filtering-correlation-id: f6adb1a6-5629-4ec6-d29d-08d6435720af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0176; 
x-ms-traffictypediagnostic: MWHPR04MB0176:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0176C0A803C51592D91DE4C590CA0@MWHPR04MB0176.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231382)(944501410)(52105095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0176; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0176; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(25786009)(106356001)(256004)(186003)(305945005)(7736002)(99286004)(71200400001)(26005)(36756003)(478600001)(5660300001)(71190400001)(6486002)(50226002)(316002)(2501003)(118296001)(39060400002)(476003)(2616005)(44832011)(97736004)(4326008)(6436002)(486006)(8676002)(66066001)(81156014)(6512007)(102836004)(52116002)(72206003)(81166006)(86362001)(8936002)(68736007)(54906003)(110136005)(105586002)(386003)(6506007)(2900100001)(14454004)(3846002)(2906002)(53936002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0176;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: pM9ImzQf8dsFsL9v8jw4uXPG940sCr0bIp3bjZPqFwNthQmIYbd9anDyS0m8cBoaBIEhYECe8G8JUelDl9VoJHgAfi65sUFCivTrnxWP7/zVtWBm3cvKo6o+b8i97tRZslhKrNFPHpPA89H9pKdJR+NheZD+KjMoiksha+JBuEbaVxqKbdiryqr5ZGtn+ZiecAFjvf8pI5Ro0lozdovhprlrfBKf6/k3q4Lod4HufrMwEj9IgQs14co9Bl+3IWun18m9fm1YVKAjzqkzQeFYt6KkteVShxGa7q9n40bfHkKr2FGkFRnmiyWSLdAIZdL0FuutVQA+7PT4XXdgJ5IpsT27gA7CFKgU3lC1amsrYAQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6adb1a6-5629-4ec6-d29d-08d6435720af
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 19:44:41.6399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0176
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 1/1] riscv: spike: Fix memory leak in the
 board init
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
X-List-Received-Date: Mon, 05 Nov 2018 19:49:57 -0000

Coverity caught a malloc() call that was never freed. This patch ensures
that we free the memory but also updates the allocation to use
g_strdup_printf() instead of malloc().

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/riscv/spike.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 8a712ed490..268df04c3c 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,9 +316,7 @@ static void spike_v1_09_1_board_init(MachineState *mach=
ine)
=20
     /* build config string with supplied memory size */
     char *isa =3D riscv_isa_string(&s->soc.harts[0]);
-    size_t config_string_size =3D strlen(config_string_tmpl) + 48;
-    char *config_string =3D malloc(config_string_size);
-    snprintf(config_string, config_string_size, config_string_tmpl,
+    char *config_string =3D g_strdup_printf(config_string_tmpl,
         (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_TIME_BASE,
         (uint64_t)memmap[SPIKE_DRAM].base,
         (uint64_t)ram_size, isa,
@@ -345,6 +343,8 @@ static void spike_v1_09_1_board_init(MachineState *mach=
ine)
     /* Core Local Interruptor (timer and IPI) */
     sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size=
,
         smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+
+    g_free(config_string);
 }
=20
 static void spike_v1_09_1_machine_init(MachineClass *mc)
--=20
2.19.1


