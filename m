Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6X-0004HB-UV
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6U-0004DO-Oi
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0x-0006Pb-SU
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:32 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4487)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0w-0006PE-MN; Fri, 15 Mar 2019 21:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699291; x=1584235291;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=OoDBb0gRrp8x7pFH1PJ7BMAIZYU656Kx2XUUu0aLtDM=;
	b=qIH0XL3tTEoEGUu2riCJGqidyN/KbH2WR4FiBxhI5pU4iHrVKAHgxjuo
	xIqj3XgfSWqp4GzJXtTwaU84z9ziJTw+NIUFr8bdMaMWHAWBvDCJE4n65
	vHOsuIhlqgQdvjoyg1Be3OxqA0eFedynTLLhkQPHVkDRtkOMGss9wmt+t
	65DDaimi7wBRlC/sHBHrvCdmHlmBZQWjmwr2np56OyP0X4vgej+YvVxnZ
	X1KjaeHn9v1m83Hjza6gBxzgtUUxPDzFZhAS1y2geqQmoPwk+D8iVglmu
	wsc7BaZB6nkwocGfKWgweeVGCvdhfYsfmTI+pHv88XUbSXx2kcWPDUTOQ Q==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549501"
Received: from mail-dm3nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.52])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZJiOG/RdBCqs5f46FbeU/Qj00XbCvOvsG7bke7aAofc=;
	b=oq73cJd/xZDYeIcQ1kx30uV0VaGXqY6bSesROTbAaBRcDhYAJ9Q1yI/4yR4RyETWdTXlWCys2L22WtqzzQxwFVpMyzlxiodjKrj4M+IHkb3f08YVsgYAAdHXbjbmnksgBUmdckC74UN1j/QBROZ36EcYJsKleOCFQC1NY4NnGIk=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:21:21 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:21:21 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 10/12] RISC-V: Update load reservation comment in
	do_interrupt
Thread-Index: AQHU25aQCMtUXtEuXkyBQ2tDm0ksYg==
Date: Sat, 16 Mar 2019 01:21:21 +0000
Message-ID: <5acd86e676e5792aa95c9067a9808743abda3409.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0021.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::34) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf2b5767-5ed5-4147-b2f8-08d6a9adb2ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59890F7FDD9367225361830690450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(4744005)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gUeVpOY6h/Xv4WBpD9y5Unzma2Xjyl9WTPKtesDXhq4KSfP0Rvz8U8FzF1EfW5n28j0aRn56TQdFeALFCaCr2UzqiBrsr2b5OvzHrCAJeGIG1CkJp7tKOt5iIwgTpCOBlXUb6VV7ow0XHOtDMCFoGiydQDg5UWFMgB5TLu/0HYSR9IGImirZV080aZvJWODJJs0wthIAXtkgTQhvYYMrEqwKQ96zaVIQqoJUeJT3/8Al7sg5/cNRLJSUsxq745kqNXkW89OrfQknGfHOV5S8tKFHjpDLwScMt+r65WvqWraCZGC5OHD3k4I0Y3GtzAA1BaSNUMgEXd3QtRNT/+FaOV1nIAnOWIWLao2LkjaSQs2be3FZzdu0drYQxh5H23I18kCBMPftaLYV89ZSX5XpsPcWt2BhUE6UlYC3RNUy/Y8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2b5767-5ed5-4147-b2f8-08d6a9adb2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:21:21.3564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 10/12] RISC-V: Update load reservation
 comment in do_interrupt
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:15 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6d3fbc3401..b17f169681 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -525,7 +525,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             ((async && (env->mtvec & 3) =3D=3D 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
     }
-    /* TODO yield load reservation  */
+
+    /* NOTE: it is not necessary to yield load reservations here. It is on=
ly
+     * necessary for an SC from "another hart" to cause a load reservation
+     * to be yielded. Refer to the memory consistency model section of the
+     * RISC-V ISA Specification.
+     */
+
 #endif
     cs->exception_index =3D EXCP_NONE; /* mark handled to qemu */
 }
--=20
2.21.0


