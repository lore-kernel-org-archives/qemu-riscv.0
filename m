Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcU5-0005EX-SA
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:45:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU3-0005BL-0H
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU2-0002dR-3y
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:02 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTw-0002am-5T; Wed, 20 Feb 2019 19:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709896; x=1582245896;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=vUbiUoxF5v3tPITvpHyD4UpG/CsVsAdU+OyzsdjA1FQ=;
	b=jMPT9hzHTexJVU3MGa6t1HwSJdqfk+Cr3W9QCg4C9a7heZUDJrxZSJOn
	wDUDSc4va0Mn7eCu3t6XHVQSVyjmUUzsS7B56wHpsQp6HVMNYoM7e61/7
	i5ttA90bwoAs7qApVaMsDKPKkqekRffMRKy4pUfOmtzNfB9L3+XihSsv/
	GQqsjFvMSfbiXuy3VDbdtgJJjP52fBy9PY2RIGvZA5y/vawMslGwlzNAv
	KMCypSv2zZhHKuwuo4EG5CLPzbnP/WekksvIi7Q0+XAUQ3ulwxw2z3J1i
	4uB3H8Y6aeWFdVC000y2zxpTl2l3izrNgrPKZUTXfKtT5b9UvWWsXqr5u g==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="106761311"
Received: from mail-by2nam05lp2054.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.54])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:44:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xhOTWMkwTOyGNzZTX8ku3wNwQu+cDajmGgGs2rcNW1g=;
	b=dc6CZ01daxJfTAOu2MOFwzHmCmZK0830peO0F+hvfV1gWq7nt1N/agMn2BsjSOMrBw44rSdLkFWc8iZQn/e6Np5LVVJPSkEMQWeU5dHSJxzKVW9Zd0hFOnoIJsxwRNi1tFpaGXWBjZ3uvltkHCMAFBVGpzH2Qvux7iRv9dOAJMA=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:44:49 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:49 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 10/11] RISC-V: Update load reservation comment in
	do_interrupt
Thread-Index: AQHUyX6mNWQtmpjPAkK28ir83RTtOQ==
Date: Thu, 21 Feb 2019 00:44:48 +0000
Message-ID: <21c6075fc9bf294109593cf987f094842c217463.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR05CA0084.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::25) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc1803df-ccac-4428-d139-08d69795c856
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:wF+sROIrWi7jnAGJsTbqpdXIBr0EDrp1gzGtlQr?=
	=?iso-8859-1?Q?3BhSsY8kSL3qXM3GARKDSi44Vy99o2LogQvPkKsLOyD58b5xPQlYVp+xRu?=
	=?iso-8859-1?Q?gnrn27YYLq5sQjA12USnWl618QwQ86Wn1xzEFM0HufUJCHIt+9ULCtgLyL?=
	=?iso-8859-1?Q?Qe3QWiOiO6G6NuMXjzSIeGPKwmoDDBntWBU0VMfw4ZNI5n7vXY50Nb3ENc?=
	=?iso-8859-1?Q?P8KEJ8m+ZBha8Q1DwhMYlW+188Lg0bDcF+GNwOsWiL6Xyd0V1PCU4lK4QX?=
	=?iso-8859-1?Q?C9bEeJkG37C8oADqtKFRWBeVU1OB+wJzDKUhCoEjuBSXnrAaajZzs9yXUr?=
	=?iso-8859-1?Q?32fhGtjdA1QBSzhCUDsrIC0Sv0jAfgYGLR4C/TSIi773WHn/Z+QAYneAws?=
	=?iso-8859-1?Q?aiytpoEAxITgda6Luv37tFSWOHRFH6s0FMFaZz02K5DNM24NuykP7BYgg9?=
	=?iso-8859-1?Q?g3yKQPT/Q3NXmqaaauISAmAGTpv1c1i3u+oOzhmUWYDuKrs/pIHr7AlrPH?=
	=?iso-8859-1?Q?xmKMGBoagtFf3X3AtRwrw/5QJ3q8T1EpFngzvcTX49Lv0uhQo4Wtq+LH3q?=
	=?iso-8859-1?Q?qsis7CKMNxxNSPoxMGz+xn8drfATRO+X8M0q0yfsT5rvZtzHXF/3jWW2g+?=
	=?iso-8859-1?Q?qd8DHWcqrq/VEVLGaF+7V9DIMjXTQuJRBXmWD5U9FwgREC4/Q0g1kR/k5f?=
	=?iso-8859-1?Q?sMTeFVbYuMza1be3cPKYUtWf+aRqRsKs5c4bDVVamCLuKi/E62f3iJ6Mh9?=
	=?iso-8859-1?Q?TDtURsVBuDsI0tPZDdv9CPGn9hnnhIvWqD2es8eDBGsY1havZisAzyXiXH?=
	=?iso-8859-1?Q?LJ0SsNx7wacyj0lASlMx+VJGqG6jt79zGk3dkqznNbU5dgehK450S2JY9y?=
	=?iso-8859-1?Q?FJM93OUD/13YE7xO4DReDDFJJwecCI8/lJtcWa7eigiJ6b7lW9UyXXH36r?=
	=?iso-8859-1?Q?pJx4Ju0w1DpXGZnecZpxc62txBZKfdo0cE407XEMapdhQQysRHWrYM7UXM?=
	=?iso-8859-1?Q?Pvm9lcSBKuhO8UUHbDtNSiXkjHde9VhrA1ReO5ZsoG0VRnUFlramfr2MAz?=
	=?iso-8859-1?Q?Q2hKSzLufRexeL8VqXqumIZR7M1QOW1LXMecbZcz2o6ENxDJS+OLmbfAeA?=
	=?iso-8859-1?Q?/pCi9kQhOTnkt3lq+/bfOxgAvN5PxsMmExxWpsbKckuD9cvUlecZA1kibY?=
	=?iso-8859-1?Q?oxZrkmPinVA4SdakBhtv7TXpWT6H4RqpD41sdrTxzttYKOjn8VJsWN3xy+?=
	=?iso-8859-1?Q?9Aoupnl0SVgd3rNUeh5p7G4n4ufcHtbBBhDte/7yraabbK8ca0fLZ3/rLP?=
	=?iso-8859-1?Q?KdXPgmQQODAP2HjHSq24YRpIT/qoYnzOPjkuqqinGuAWHAygp6gcjc61wd?=
	=?iso-8859-1?Q?mdO/BA6Q=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB0985381600720F18EC7F1AF2907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(4744005)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zv4OWdTB0QYP9BhvF1B2Hv4NOTl5uNlBaYYYPeeDoXIMjLoDcB/0K85BBoxsUw5drbnYMsBfI3XsgBEjr19+G/c+Zdy+6uTXQZyl67Qh6d73ZQnUeqF86iZeqM6u7P/orqY8K4RRG69OoYifOrySUHStzakljVlh6q0ccZkz+nO8fYzQAqGwJHhstF7gTcFwKdUfByEpxCulM1dZ0GgUUwtE11OJizLy3UZeDlPiWOQUO7pgiBoBRYm4ubuwkTMCo5fCrDzpvFdSOUnFQ/fDVjj9ZakZTgQ+/Rwg6i9hn+RH1v9922hg1sHlAOkTZlkCpcOrVL6rncANWfSOMNBBPblY+pULNCMFw9IJXug0pT1IQDBvnBH8Zl1+nJPT5IACxAvJhMXbYVFeBMWwJ1y9utFU5AEO10+YuU7+xS1gni0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1803df-ccac-4428-d139-08d69795c856
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:48.4236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 10/11] RISC-V: Update load reservation
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
X-List-Received-Date: Thu, 21 Feb 2019 00:45:04 -0000

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


