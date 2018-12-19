Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhOP-0003T6-JQ
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhOJ-0003Mz-Vr
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhOA-0002QE-KH
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:20:21 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:16010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhNy-0002BP-LT; Wed, 19 Dec 2018 14:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247202; x=1576783202;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=d/vgDPhfzdcDSncbcj6SM70p3CgdU/kMp06loHl8EIc=;
	b=nWV4nodydaTNalT1GQnFvC68Y1WSyhuXr5BIt7rRjYV4GfEyvbPMj1p5
	O1RuwxM6dMTwHwOMvK5G6lVDzs0ZDFanloD4xHkM49/WFfma4yrOfv4iV
	0npIs7dhcDuaiKetv+gzbAONum70waaOO2gPhbGMtllwoMeMyMyGYPYDd
	pKhCISfZ7sr+sFHuvXqOKGCJfSZSuX9BRtwTiWzJBl8bbRDCQ+pjT/dzr
	w3t/lpYXmfo2Bk+M0067G+t/7LpWpzst+r38HL/NrUB1R+EQ5FqCej01i
	jGdLiPkHVsc7yhq8l3gsTTHjzjLHUzJLkEP0CKOBfNdR4D+bvIrRCeuxK Q==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="101924004"
Received: from mail-bn3nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.58])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:20:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yPUJaM0wWZHLTYVfZkTyHnHTkJnpg2ybHbfiWpabKRI=;
	b=ZplGtExzLXuhzmIi1dD+oFYkvTnwi5/LW6u8zEMUCaZJe96GuIoLmy3a0Rhi8RNNsQKb1ndelSqMBP3PAxgYCMMetpGJGcbVXXdZhdx2KwNhFyz78qAj803UQiLXdRBw5F6651i9CNJNGhTr2PV6aTAQnQqZRS6e8VbbNtQd1Pg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0832.namprd04.prod.outlook.com (10.172.168.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.22; Wed, 19 Dec 2018 19:19:59 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:19:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 21/23] tcg: Add RISC-V cpu signal handler
Thread-Index: AQHUl8/Vbe7+X9ITxEaF6HexsGi2mw==
Date: Wed, 19 Dec 2018 19:19:59 +0000
Message-ID: <c445175310fa836b61fd862a55628907f0093194.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0034.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0832;
	6:qMlQtSCqr2rO61dDnVM4rf+6amBxEdi6SXBZDfTYvVByWQ2haslKdEYFV1TMFgmGaMN/gX+cleSFlANpJ7fgpaSFOKOK7jjLKZBtAQPCZ0K+OZRmfcRGDJDPi2iLrm4mqq4YQl1XbX7ox8ND80Sy8TNKtj77QB7Vgv2nqHkDx2RaS/lGKIqtLq15g5wg8pP0D0WjCQf5cX2GpGazaV1A4lXT2KkzUglOPkqU/o65+EbYD0xMCO/ygN/UjvVd+RJGBLAILzB03kY/IKPKuYwpLzCTvI5vxRIg0SketnacZJ97OJcYf5flFxh8aMuqfBEcLrU8lReelAPg1azgncZbvuwUvP2uflhMl75JOHUIcAVWycg5elcOrfUnGfBw/AtNEuaVwKaiZrG3UXnM4zl28TX1vL8BD3OJ8FBzNR9GW+4At8Hjenyuavsx+lvrKNRj+s6kKiyV6wi0iIdgOaYEoA==;
	5:uRCFaOi7MkXvhqMWLGBSx6nCLf34fKyRZCoq/zfmWoEXWhm9o/+DWHnJa1hcrJ83Ibqt29MA0Nhq9+cGr0IMgR0L8rqwalgASXb4kgnihihE8hxuwX0chfdGShFuKkEXCsIRoodlcDFcoYKDIu/Arx5tfZocolfWh3UCB8Llm5U=;
	7:kuMDEECRwx6nEpOAIVSk56TXf2R5Yi6nTCzIIGTZswv++z8zzW7BX1/7LAgMggH0RP1NIsVLdi5o/5PJQSlBjTVUnkEhRTSJzGir85m0Ckn0KqwyAayI2HcsFaiWIrLInPFN3zRZw86np1GdAuM3uQ==
x-ms-office365-filtering-correlation-id: ded837a4-abfb-4c1e-e791-08d665e6f79b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0832; 
x-ms-traffictypediagnostic: MWHPR04MB0832:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB083222C7E074C0727EC7350790BE0@MWHPR04MB0832.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0832; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0832; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(366004)(396003)(346002)(136003)(189003)(199004)(6506007)(68736007)(76176011)(386003)(102836004)(476003)(2616005)(44832011)(486006)(97736004)(118296001)(478600001)(316002)(26005)(6346003)(4326008)(110136005)(54906003)(186003)(39060400002)(8676002)(50226002)(81166006)(86362001)(6512007)(52116002)(81156014)(53936002)(71200400001)(99286004)(256004)(71190400001)(14444005)(8936002)(446003)(11346002)(305945005)(7736002)(106356001)(6486002)(3846002)(6116002)(66066001)(25786009)(5660300001)(2906002)(72206003)(2501003)(14454004)(36756003)(6436002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0832;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-microsoft-antispam-message-info: cBCaGvYIEuEvTzj+dgiFCMpF3LW18sLp47H++dkpwvWHi1Wh7qP/ENsAhYx0DJFLxyjWgBXinNtALzF9fbo8kebLbXiwmdo6u5mSaunN50KC4BYYca7Lwrx3fhHOzh8VY1VsNToFxsZ5ZUIJ1fAa2fZqfnpYO9LkW9UPcRpVc3zgzaIM+HtsZMgDbrBL6Qw9Qm8q2AI2yw9r7t8kCYMMEUiQ47H4cZ2MgOaB3CkUI2f5Jmw6eJA9I01obM6PqGh+siJ7mESSzCQ40CWtyXNccnRCQPejFqWxnVr3dAaVwWxsf3KCtIYSi2e4UDnfi0U4
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded837a4-abfb-4c1e-e791-08d665e6f79b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:19:59.2879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0832
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 21/23] tcg: Add RISC-V cpu signal handler
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
X-List-Received-Date: Wed, 19 Dec 2018 19:20:28 -0000

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


