Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQok-00040G-GV
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:50:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoi-0003y5-AQ
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoh-0001Uz-H8
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:50:00 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8307)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoa-0001SS-GQ; Fri, 07 Dec 2018 19:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230192; x=1575766192;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=G3S9Dt2dYVWGm7ZW7Y1T0WEiO5lLHciM/p5Y6OkVtko=;
	b=r2Mj0ERK7SPYNIbhmtsWR/iCBDs43cJXqiXemdpY+IcDXNOqcbhqNKPw
	Vokaqyz+TN9c2uxAi8MOze/JycarkLON30rkN9MvnbpHYlUndGibYrEmg
	Ch008JLDWY6xMCmCB9WIlrPWZ/hr9ftE6JZQJBOXPTp8bwAPz098+0gDt
	TcPs8eJB8KmY8KwwZjGEVuOMBB5RB4xUdwBcZ4iYQFfxCfZXV/x21Zg5z
	9QTaW4ye5in0Qdw7DZ0Rm47CmoeHwupJL0mA4Der/BqgoUqrt6pwHOw6K
	wgB9GdYNkv6h7ggPEkOQAZN/oZ37zYONFOFCbmIqXDXl9O9fh1N4OOU2M A==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="101012207"
Received: from mail-bn3nam01lp2059.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.59])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:49:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Y4ucUXJN00cLhyglSRxKQiHDDBbJ2TVMusipIKPDFsw=;
	b=eHz9DDr6FbY8pnS30TGYLu+a/z8I9yRX+/I+vkJL3cIgFi1u1tRzfKHG5h36wUJ5INtj4g68BL3CLBBLsvnf+CEy+4NIEzUbh9RCVdtAiWz5z22sWvhVsBGS/m1zIBrRORkBwhKV19liIxDjh7B0AIzhFWZlLu1KrM59wKV5RJI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1215.namprd04.prod.outlook.com (10.173.52.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Sat, 8 Dec 2018 00:49:49 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:49:49 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 23/24] dias: Add RISC-V support
Thread-Index: AQHUjo/rqSLRD9yErEGIYhx7CMOQAw==
Date: Sat, 8 Dec 2018 00:49:48 +0000
Message-ID: <c26d95910040e1c7feb956d634a4dd0e6848089e.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0033.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1215;
	6:ssrRqkE+Dn6KMk3t9xCMaivaLrd74eqPnLFEHgQ7H4UwXPGztu3ITNnLcCVFqfLSwsJEQuOA3ENOzrkaaCCMtpHs04LkcOXDJQ2/PxTRveWnLUSbiDmys659wFx8D0Z4fyIn3L83h6LZheZ7EUvyiudqQQtazI2bN2AJ4630X6kqA3bMaFSPJtWh0KFCrvb0UEJVYV2LbERbdfsradjTr54kLSzT0JjesXMYByIWKsIJF9k9UmNP0fA71nG3/l8scKDMtkPhDGXTnyVIFi+f1LDW5ZZYBpf48TShZgS59R952OUgbnBksBCb5x7eOum/4hlfmKaCCUtgvaT/SlgzkbxGLSRA7PFlPReKZU1vXKClkyAvo5WuxIT5M9Yt4KeZmYXuPL3yCaty16mjN6M0lkM6oeb/LI+vY0p3MBOR0PoVBGhsgShNOTP0h2vNdScxHCHX2C6qQKSdXWEpuyVC7A==;
	5:Dh3tD9e98R1FkYOYXTCG9Z29uV002hxWm6pupvSBNUIVqE91b8Qwq1LAowaG6eo/VwbE++cGqfsfLgayrYzdDpLGsWCcsy4fFiLb4hLAigB1aPY07leR3ZHkUDOKLfAyYvw1XCgD1kpsgNp4SQMrLGiQm7DP32dsfvwh+Ug3qVE=;
	7:n4bVoOc8GtAB4/gc0csqDqrtUW6yknty29t+Xe5clQ95ILj6Tb4BDihTvV18SyFvqds952881dD0kBHCeZEUEDxY6Ttwr85BA0d1Vdg6aWeSSlTBbpZh7/c2RLXrj1OfLJzmhhTW1ce6SCFMZFCXTQ==
x-ms-office365-filtering-correlation-id: e88ba4f7-2521-4bcb-096f-08d65ca70e34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1215; 
x-ms-traffictypediagnostic: MWHPR04MB1215:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB121539D2DD71AE15F872399B90AB0@MWHPR04MB1215.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1215; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1215; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(476003)(44832011)(305945005)(11346002)(7736002)(81156014)(8676002)(3846002)(2616005)(118296001)(5660300001)(106356001)(446003)(81166006)(6116002)(86362001)(486006)(105586002)(6506007)(50226002)(386003)(76176011)(2906002)(8936002)(102836004)(26005)(186003)(52116002)(66066001)(97736004)(2501003)(478600001)(4326008)(54906003)(99286004)(110136005)(68736007)(25786009)(256004)(14454004)(39060400002)(71190400001)(71200400001)(6486002)(6512007)(72206003)(36756003)(53936002)(6436002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1215;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: zj76Suf1xDbXAwwvD8JFg05eUORD0+0NTEntV6m5NX+OlAvGud7UksYtbQu2U8DcCwRTKeHS0YSwmzymBVUyQwybnsInDQgJCpxf5nQaNuDhGMRL0zZNuydZtQpNLMe/gtKmY47lL2ClCbQwAOZGzDr3qNAa4lyhjTuQcq3TPFck/U43oLKAVM013LsSRgmoYA7Efgp9PhXmApi+l6gPVjbUN63DKSN1TFJHr9vvr7eGiAj9wypoi7f3HBhzrVFBMKc4J2q6HYLNtK7EmYUZSeJZNpXKgJHlNOVGKvutomDBqVtmK7w1m11Biu2UchbyrXfCP8lmsoVQHJENC8Jhfej6IpOYz+I1ydOJQgrYwJU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88ba4f7-2521-4bcb-096f-08d65ca70e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:49:48.9861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1215
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v3 23/24] dias: Add RISC-V support
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
X-List-Received-Date: Sat, 08 Dec 2018 00:50:01 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas.c b/disas.c
index 5325b7e6be..e627fc74f9 100644
--- a/disas.c
+++ b/disas.c
@@ -522,8 +522,14 @@ void disas(FILE *out, void *code, unsigned long size)
 # ifdef _ARCH_PPC64
     s.info.cap_mode =3D CS_MODE_64;
 # endif
-#elif defined(__riscv__)
-    print_insn =3D print_insn_riscv;
+#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
+#if defined(_ILP32) || (__riscv_xlen =3D=3D 32)
+    print_insn =3D print_insn_riscv32;
+#elif defined(_LP64)
+    print_insn =3D print_insn_riscv64;
+#else
+#error unsupported RISC-V ABI
+#endif
 #elif defined(__aarch64__) && defined(CONFIG_ARM_A64_DIS)
     print_insn =3D print_insn_arm_a64;
     s.info.cap_arch =3D CS_ARCH_ARM64;
--=20
2.19.1


