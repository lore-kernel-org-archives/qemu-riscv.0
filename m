Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXASa-0002sp-RJ
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:46:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASW-0002rF-Lf
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASV-0003QS-Nc
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25781)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASQ-0003NF-GV; Wed, 12 Dec 2018 14:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544644006; x=1576180006;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=d/vgDPhfzdcDSncbcj6SM70p3CgdU/kMp06loHl8EIc=;
	b=lO7HbrX6yrC8S5GmlF5MqsHWJOOxBaAGYYaH1kpwd6lPBjazcHhTQvqf
	lZ9T/9XfD8uRcgL4P0w6SKSsPJ2eHDvGyV9GoYrT5Q+AJViWFBBPN/4lL
	TcI8Xl/FcwAQ8kwP5rEb6fuSBPejq8DWPxAfu7hOdoBMpMpMaI2tYVVtZ
	VIwTC/hEvlPcQ15xK6G5KMvM8yYVe8hbgcU3COqIoOfY2vmp+8CkpziTY
	TA7QWVEJLeEDfzrYCJ6P5hgx2dL2E5ZylS9PetfIzRbRq62L5BaAr7d+c
	BRVkptLY7SGuprxU+SsdLJ4TDpZYhLujPafeo+IQ1568q0Rspz942CAWz g==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="194334243"
Received: from mail-by2nam01lp2057.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.57])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:46:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yPUJaM0wWZHLTYVfZkTyHnHTkJnpg2ybHbfiWpabKRI=;
	b=U1k5yYkLpqeR0IiKnPEy8SAD+RLarRXhNMOfO4Uf99aSK4tdeuHR+lVvCn+qYsDuTKPq/1a+tdsd1e9hn/P0QNWRJVLkWukOubDFEGCbC0cMQqNIFgeMMhUsKDTCfZPiyy7YQvh/pUqyWGEYjsUDwbcR2Vc8Wo5xKVYJG0W8HL4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0446.namprd04.prod.outlook.com (10.173.48.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Wed, 12 Dec 2018 19:46:07 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:46:07 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 21/23] tcg: Add RISC-V cpu signal handler
Thread-Index: AQHUklNSMz49GiZU/Ee0ABuUwzDQ8Q==
Date: Wed, 12 Dec 2018 19:46:07 +0000
Message-ID: <19bfdaf95140e095e141f5be97566eb67d05d916.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0064.namprd11.prod.outlook.com
	(2603:10b6:a03:80::41) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0446;
	6:MxojBBOP9Qbe6jdqlqywIchop74usUwiTorD0PrLWvqtRbofcc07Rz+n6MGTsvfy/ARky8Z6V65Q2/KtyMTWsmo0YYNVM7pNMM094NVV/Bq7/ZHrk3hZ0BIhGRmBQpVw8GFMps7yuxCdaA5I4ahRwnIbS5MVivcKAMwSSbMkQycDB/wk51hEwiyXWRN0MX5H+pVHIRw+A1XJj01GMjKqrRgs6DgkKqnlMCeH+mSTsY1/U6vcVqVc8OsH7fHyQNv7Af/n1UUeMAPn94jVaLPjhvSV46ega2iqIoZre2Car8e0wSmdD78EX/cLh5Z4AiNaXqfPUxCts6ijmiIOeVFlG0o6N+LB0/2VTYNqVubg26gg4m+Ii9poQ0x2rhSi2BKI5Rj4H1/dFE7gjoHcr+MrzUnMW+BqYAQPEo6FPI42LauEHSDNNsKXOx3R7VMv9s2xX4SPeO25JSVT+SzQB9hxGQ==;
	5:SDSdXUDCjENq9UKy+d5UykGwcVjB87+Q5V3IKIzDZzX6yESA9wJa3fIUMBLIYqkvoofrAepbPBVoSy0+fZ61lJAcARf978UQcgmCQFMOTpe9XwwWYBMXp7VCUgGafZqdhZOWXegr9/13jlJoc4lgsrzEqcHlkBRu1xq3SfTLdfs=;
	7:CYeCeBA7gu7qPhb6H15c+ZrnR3itCnfV0gCnNkRUWunceICJXnNzM8OxPaOdkLQPOcd0h3uan/NOsiE0Aq+OttiHTkxGvFNGM8bLOkGneF37cQJOFpSEY+n1tZ7Gmj9boT8uOhbGXqBtG+kZQIUT5g==
x-ms-office365-filtering-correlation-id: d5a27ecf-a2ad-476f-82bc-08d6606a7541
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0446; 
x-ms-traffictypediagnostic: MWHPR04MB0446:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0446602A03387A965E502B4190A70@MWHPR04MB0446.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0446; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0446; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(3846002)(71190400001)(6512007)(97736004)(256004)(66066001)(2501003)(81166006)(14444005)(50226002)(53936002)(6436002)(71200400001)(8676002)(106356001)(4326008)(6116002)(39060400002)(105586002)(478600001)(8936002)(6486002)(305945005)(386003)(6506007)(44832011)(110136005)(81156014)(186003)(72206003)(68736007)(7736002)(102836004)(486006)(316002)(54906003)(26005)(99286004)(76176011)(14454004)(86362001)(11346002)(476003)(5660300001)(2906002)(446003)(36756003)(52116002)(25786009)(118296001)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0446;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: zIvN7ZpckLKrfnTddqxrvhLBGgac0BWM65QTdbowmmE6jdmLxFHlj3HeH3g+RX+vBxN0FDCGvoFpNRrfs9MCXCteeKnTdRS89/mnQkYLpn/IMC/Ef3ZRGFhKAg1ZYyzLs/CbiwwqLdvUrU0+0qDqNZpx0g3PvDJk1mTHIgWGk2d7jOIUt94QyQ/fvNjNpVBzSdhFW6mdWCcL8xzXkULTJkfzQt5kzUNJfNTZ21+SRla9JuDzPJwuPJEC6OnFr2As6fz7ulRh+OOjI3XIXGpA80V0SbwiJvrL6vU9B94sTK1jWUFfI/uTpda+w3QSP3bd
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a27ecf-a2ad-476f-82bc-08d6606a7541
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:46:07.2187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0446
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 21/23] tcg: Add RISC-V cpu signal handler
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
X-List-Received-Date: Wed, 12 Dec 2018 19:46:17 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 accel/tcg/user-exec.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cd75829cf2..941295ea49 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -571,6 +571,81 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
=20
+#elif defined(__riscv)
+
+int cpu_signal_handler(int host_signum, void *pinfo,
+                       void *puc)
+{
+    siginfo_t *info =3D pinfo;
+    ucontext_t *uc =3D puc;
+    greg_t pc =3D uc->uc_mcontext.__gregs[REG_PC];
+    uint32_t insn =3D *(uint32_t *)pc;
+    int is_write =3D 0;
+
+    /* Detect store by reading the instruction at the program
+       counter. Note: we currently only generate 32-bit
+       instructions so we thus only detect 32-bit stores */
+    switch (((insn >> 0) & 0b11)) {
+    case 3:
+        switch (((insn >> 2) & 0b11111)) {
+        case 8:
+            switch (((insn >> 12) & 0b111)) {
+            case 0: /* sb */
+            case 1: /* sh */
+            case 2: /* sw */
+            case 3: /* sd */
+            case 4: /* sq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        case 9:
+            switch (((insn >> 12) & 0b111)) {
+            case 2: /* fsw */
+            case 3: /* fsd */
+            case 4: /* fsq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    /* Check for compressed instructions */
+    switch (((insn >> 13) & 0b111)) {
+    case 7:
+        switch (insn & 0b11) {
+        case 0: /*c.sd */
+        case 2: /* c.sdsp */
+            is_write =3D 1;
+            break;
+        default:
+            break;
+        }
+        break;
+    case 6:
+        switch (insn & 0b11) {
+        case 0: /* c.sw */
+        case 3: /* c.swsp */
+            is_write =3D 1;
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
+}
+
 #else
=20
 #error host CPU specific signal handler needed
--=20
2.19.1


