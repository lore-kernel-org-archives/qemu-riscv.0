Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhMm-00023j-Ha
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:18:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMk-00021U-Bi
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMi-0000wg-Ux
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:46 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:23342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMY-0000i9-Kq; Wed, 19 Dec 2018 14:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247114; x=1576783114;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=QRzcbsBz27aGcH/KEjWa1JYC1G2ut/E5sPpXSy4s7wI=;
	b=Ic3ch4W6YPGaim2vssS8gld5EyikYB+dXSYbSbPrhiId4osawterVFeX
	FHS/qslu/6Dv9MZxE87/QWCFesX6mOdOvhP3tGltlKYL7/YY1TOdWx3d0
	aaWn3+Wopr/4cBVvqqSw1kzEE+dQVR30Ot5bQypKDKwUPANdxSTex/ZYG
	g2FvjC4xrdFLIHpruGoPcZUTLGzBGCltnyY3vkSCKuGV59NIzqeVgpRWk
	BM/rV0zQPP8CShtjsg4tXVpoYTNkpf9nH02Uvn0CiK9yxHPJofXiM+6gK
	YdMHPFW+TDyntsvshyBrXs/fZhEu6p70Yk8BaFRQPIk4fVZb50dPC7DBi g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="201718430"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:18:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wOVcx98vivmKsxuWZBiffJh7ETHu5gPlYgybjhx/PtU=;
	b=NfHMHyN3QxO0s2GJ9EqLyyJQMpUl/8Qqp4iQ4l9jJ9C2HZNdSWzG+Dxj9aQMhvwxvshZqJc8rYAGjuxRVemQXLMh2+RqQn7xS+VxytgY96pHBirDE5LztNNT5LhkYDDV45ORrT9tqdW6VmeFymYqwSru9YsLFP0eYYN+0tJGNhc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:18:29 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:18:29 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 12/23] riscv: tcg-target: Add the extract instructions
Thread-Index: AQHUl8+fqIi9TfbITEaSC9NlFm15Kg==
Date: Wed, 19 Dec 2018 19:18:28 +0000
Message-ID: <c4d2afba46efefa9388cf3205fcedbb9a5fa411f.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0023.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::36) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:f67kUQ2/Lw3Jg3tKfu8tZRHsIEnbp6lMUqErPDVUZ1xtVne7lrg6uIE53t63yUHY1qe9xSGSIBpJHpfGVpcPWpyyRPvzs/hGGUg/Xz2Nmqaz6bNLwOAXxBug3jpm1eBwc3aA3rlvqEWrC+5sXROouyim8snid7wl/AlNImwNjRiIenLSASPbE3pzyb/NVWUjVF5jMbUjyKvwM+Mj/LHBGWZPEosUsTPkvb5AUceGy+p88oqooa4f/r8kt3QtF+ki9Jvxx+WGMvJYPfOFXLF2mzXilahrZ+EF2K6b8s6JdqmEVbnt9YLeW4dodsYnVi8BnT1vhxu2CT1AlNEh5XsA+fUbkX91zBUqxyAf3TTlpDuTtWDn2TBrX4/mqx8YDU6SOpDHj+qEC9lNVahFM4UdFu7ROUsyjQBuiseP03vRi8qatCAYNYY0cJFRtIE4EBY5dz2ntpX9jyNZW3IL9xK9VQ==;
	5:Fe8DqlckpIOdn6L9T+ImAlcc81TA89Gabyk8I3XVMTchi62QXhYsFMK6hDFxc71OllaWi/bD+B/elykj7NQp2IK+Gz1vauzRgN2LmIYnvu7YK6Q5jhBwRs3Bvkap3Z8xiFjZ9t1Cv2seVk9o3Jbfe3dwhQexS/6NVw3+JdPusWM=;
	7:dblcwJP5hVQmyGYDJwY1jY6ssRhuySqyVRqJeq5sqNwqFCKLCq2M5lSAhuXNdDxEfbpdMbwH4ckBTq1uvNvMqWkMBls/6UdNH0gpXawV7emA51yqhCAp5hwnTzY0VoJ5ctyq0c3eybkJFk6ubW+GSA==
x-ms-office365-filtering-correlation-id: ad97e6d6-a792-493e-cb0a-08d665e6c1c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0848D8204EAB9071C4E1B7B190BE0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(6486002)(14454004)(4326008)(72206003)(8936002)(86362001)(2501003)(50226002)(71190400001)(71200400001)(97736004)(6436002)(8676002)(81156014)(81166006)(36756003)(68736007)(25786009)(5660300001)(478600001)(118296001)(105586002)(53936002)(256004)(305945005)(7736002)(6512007)(316002)(44832011)(39060400002)(66066001)(54906003)(110136005)(2906002)(52116002)(6116002)(76176011)(26005)(186003)(102836004)(99286004)(486006)(446003)(476003)(6506007)(11346002)(2616005)(3846002)(106356001)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: gu1fnjzdzE4fKoaA1KmVfJEpAOqEoa431/HbI9LeA7FIWQQSF/Z2RrsjebNbQwZgKagXygQKGxi/rboSygnOn++W7RqjzqR/xqlbu3JTmgzVjfyE82fjZC9hV7p5sUjsRt4XAYxpD7nblSha5GL7UEPybZhkJx+3FeESCUd9W05i/zSJBqbIjiHdIUXUqKsH0N2dzNkgBkS0qETLMR8EhocJbbWJOMyAU9PNbThHTZx5rjBV8uY5NLle8rXV7DgsC/0Y0KX1fE7swk7RBNtG79qFqTdIEUtlCuvetELjv17H5jUWYQDPLMPY/7HdV5Rr
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad97e6d6-a792-493e-cb0a-08d665e6c1c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:18:28.9746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v2 12/23] riscv: tcg-target: Add the extract
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
X-List-Received-Date: Wed, 19 Dec 2018 19:18:47 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 01b4443d6d..48399480b2 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -596,3 +596,37 @@ static void tcg_out_movi(TCGContext *s, TCGType type, =
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


