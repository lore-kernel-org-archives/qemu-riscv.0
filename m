Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH11-00068S-Fy
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:01:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0z-00066u-VJ
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:01:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0z-0007wT-5b
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:01:05 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21611)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0x-0007uN-C8; Fri, 08 Feb 2019 20:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674087; x=1581210087;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=vUbiUoxF5v3tPITvpHyD4UpG/CsVsAdU+OyzsdjA1FQ=;
	b=gktqDzAyc6Y/SFfEi3SbAKOSDDHdcT4tqLdIpCrt5z/NtssmGc3MypXQ
	FwV84f0G9V3p5UMS2oVufnkVKeJ54Xbmq7FdGX0gF3jtPCnJVhbPjHtrp
	Db3YjzyijNua6FKyZJHNaOex5D2i3aTCoNgp681zfTaNSOaz6t6t3hqY4
	OPonQV9N4rrWzfZBxIuXZ5DzTgjUSg7AoqYsE1DlaNuTb5Ef/Xa500QSh
	nCoJe3JtXoNF6LXi9+30WuA4mpaDeOAZ4nuekORZpq2tXATS4BKBFgcKS
	7Dyx0+Kne5jPCWY28bJdQ9oTHfBSrimFh8WAdO7fJ6k+R7w18nxzcIWR2 Q==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="198999592"
Received: from mail-by2nam03lp2054.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.54])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:01:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xhOTWMkwTOyGNzZTX8ku3wNwQu+cDajmGgGs2rcNW1g=;
	b=Ea4ONfH2VVotbijGe0nRjzIPSgcF39EPfrCYk2hSOjxBA2EMzh5AaCcAIjvXcIAKqHvrIk/AlXyCrDMrljaAz9Rq9Wg/vcgOrGcekyiV1pXVlvfVoJaEQfLFthjDIO074Y+W4iuV3kRc5bXFfeytk87402mZCZve6UE5GJz9Z4o=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:01:01 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:01:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 11/11] RISC-V: Update load reservation comment in
	do_interrupt
Thread-Index: AQHUwBLs4KdlAd53X0OX9eCegVfLig==
Date: Sat, 9 Feb 2019 01:01:01 +0000
Message-ID: <463204ef8a90d618f07f231676ffe5ae7183935b.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR05CA0037.namprd05.prod.outlook.com
	(2603:10b6:a03:74::14) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:Rg9RfryREc/qURfKOi8QVZWQ9TnMMmp9LrbkVGl2WNTkyjtq4M+iViwZrYP9rdSeYTR/+zo+AtQzems7hCsU++Dt/SwIaQFSk1JhUOAGRPVe4N89JY48Cy4+9rQjMwE2v8KnsA/8458fWMyPxCN0Q+JZOvaBFALr9SsG25i1yXJ/IzDf4FT/Dk45NxApgC8TKyvEvRqTdJBMF0yc0rhmw7z/0iIn6zciBgepiYNAUX5h37unP/bym6tUYNGCcFuLedaNBwIu57W0Z9mAbmXVIBJzn+VuOWEm/tF9Pojj7TyTqD0ChL2//w43W0UbN/5/TK/xwdI7W6jc1OnuyQT8weLlq5e1VDyFg/EJaE7WctsCunVNtdTy1kSDOZFYhFG7JJiWIpKZGV81AXzHQeZAq2AN2/L6fNyLZAIQjZLGZhxQvQKsvP1rA2DGm1KuOZ9a4obDf6HoIqUYDW0OSQ7Q/w==;
	5:96MBqph9wY/3QLQBBYpO8r/dGEJxCmAHKtOIM7ykNDK8pUtsG0IMDBDswVLIK781/ZabgzE53GmerC5HU672EIjD0WigokdgFhwnzwTNIicBNU1++W30KApSs4/aTCIlSkW6dKibnWaiVyeROicSfGQqCBa3EQYJ6+NsZo+GYapK/BUMQfxboWMApSaDCrK8TwYGjBp3erXQTXSDegXH9g==;
	7:qMnKOsYjHZeDoAhfKM7uV3xEMtff1skIhIc3XpJKDe6/Ki1C4jqnt2N+RfgMz0YY02/OGJzbjTovcG1lTWP5kD+UhB2V1TKdWynUeXBmfNSDPV13OsiTiuGO3wwWxQ7dVIV0dWyGR3d3dty5owhQAw==
x-ms-office365-filtering-correlation-id: e9d4e9eb-cbb8-4769-f134-08d68e2a0eb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409F1E6D3836D95C4BF3C4C906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(4744005)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +JR5lFmNyvEWbA3TP8cz8e71vvVMa5c9WCKh2iddqLvszTthLRuppNgRbol6gRMKE3CvWzsThbYjqoPJyFCwfWeZEaIoKcscIFqfEO34Z0fGxnd2uza7udwuKHJHmRZf+jeiqkvb7aQ4EswrQrlqRv19cZOosQltSYiSkA68geNkvwDBLaJrWqD5EF0qCq8MpQ1QfYxAY10PTpt+iUlx948RuNA9nAZATh7oSvLGR38T0IuuU9onqYqcMTZmRqvoik5vLob4+NigYMp8rKM99zWKM17vPvB9PKZAiPUVIBrEqYYYDw54b33Gs8F7XjBbE8m01SjjUgsOEzx2QIzhYgUxgWt/B6uOvtZ4DPgjbOIFuPaZDUWGaa46oWi7PqLOWBqgkoqHI5C1Cd5caESHO+GkgcxjjcvIFv4RG229pTY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d4e9eb-cbb8-4769-f134-08d68e2a0eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:01:00.3759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 11/11] RISC-V: Update load reservation
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
X-List-Received-Date: Sat, 09 Feb 2019 01:01:06 -0000

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
2.20.1


