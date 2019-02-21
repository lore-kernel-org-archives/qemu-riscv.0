Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcTT-0004kD-B7
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTR-0004i6-7E
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTQ-0002S6-Cd
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:44:25 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTN-0002QU-3G; Wed, 20 Feb 2019 19:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709861; x=1582245861;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=/gOAmNvsydMG67UaJC2PD2qnb65CTzoNUErgLy0F96s=;
	b=X7vjb5NAXU1RkaGRrp3U9DNNcLYrx3J+fZ+qketsyO/Q1JVX92WO6LDp
	/dNYbTLcpXJzPmdyvyinIleCHLG5Zz8TqDAudSiu4OQy1zH4qKpOt/3pI
	sbpW8hvRA2tczTSf0Jf38LO4dlwTKE85v2gkTbAoZIAUWALhuap4VZouF
	aaXgqL4ILj/IkaJVOjAT345Ujf/ec3JKcqjehu/MGSVlZxL4+1OkNXMEc
	TJYF/WdwtA2cUjVHLS72TBKtEY75oPVYGXez13qbCI52NGZFzwnoh4Ps1
	Ft/sGMbXZOsSl235z0ZeDE8b8nGrhpnu0ZPWtNLWS3sl0aBkaVy+cK0mB w==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="106761275"
Received: from mail-by2nam05lp2056.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.56])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:44:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/kUQ29t5TrfYlfzqWOQXVR8Cybxb9FdATw7XRW5RQBw=;
	b=LbRF2D3z8SqtnemSXhgeo4veU5faGcjjPMbJNO/VVk5YFQWdN9CJyFM3Y5Q1u8GLrx5VjrYJVgWiKxOcDoHrX3AF312l5bGYBz5sY9oFto6GWHOJurQHr7aLJt9AawpaoAcRDf+osZGawmpGMF5abKfImwnHbCqn/GfDhSkC3L0=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:44:18 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:18 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 07/11] RISC-V: Change local interrupts from edge to
	level
Thread-Index: AQHUyX6TXQ7br6ItPU6utSBD9quQtQ==
Date: Thu, 21 Feb 2019 00:44:18 +0000
Message-ID: <b2560b2a58fcae354ab8efe33cbe185962333b62.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0026.prod.exchangelabs.com (2603:10b6:a02:80::39)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d5cc961-0efb-4ba9-ed18-08d69795b634
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
x-ms-exchange-purlcount: 2
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:wOCUapSRq2XP/eWk0R1936ai3wAWX7/j7OQ+fq1?=
	=?iso-8859-1?Q?VCppzCqxZa9NlNf2yDj6hks8FABvlWTLeYQh6AtdEznwdpFfW9GdgLkaNs?=
	=?iso-8859-1?Q?yA9uZ0mptKYb3IjeUTekdLQ5x8ljbKOEF/8FS5fBCTCuMXy2A+6jnG0mMQ?=
	=?iso-8859-1?Q?duVVPiAz7dUXzSVPUbs9Mu8G7N34Bp/ds3ydV6Hopz8iKYDMrLi+7Ph8cA?=
	=?iso-8859-1?Q?Idg60AK4tenYYUg28uF9b9KUkVKwalDPD5+9o614JnH2N/X1Txp3hAhm+g?=
	=?iso-8859-1?Q?ltSLXHZA6D7jnmALCgwe5RsgKDWvbAV9k09LMcLZKBeqrCHNPMz5OwO4xX?=
	=?iso-8859-1?Q?ltBupxlHPTBHlx9FCdRqEbDCFGl0boBEKzcQolRzGPtTGIcE1vFzKddg6O?=
	=?iso-8859-1?Q?ZSpZuUty5KLbNncyj6P+b8QDLzKF1NQZOuIgPE+zubW3HBwSO5B2jxcA0O?=
	=?iso-8859-1?Q?0B9sMakQVGte2/WyJc6owndKTnUsGpZ3cKWx2GdhSfuXMhP4oyk15s7M1d?=
	=?iso-8859-1?Q?aEA0gE9QSjMlhdrcnIpOSfySVW+ciD8x5cIo17NDy71/p6ljCmNCsO0ee5?=
	=?iso-8859-1?Q?pQ6aB8TSyaK74U6alXt6a3/JLujSdupJovU/lIc5Exnw1FeWaZ1qsxFPpp?=
	=?iso-8859-1?Q?pALpIWbdBSkipLd8NRODiL3+PIEgPlRdhdq48sC3dFTcWyHRMkK+bydxxR?=
	=?iso-8859-1?Q?qOXyyh6Qfp/lQscX2CaUwt5JYAvt+FyNcZPrFvVtaTs+s2t3SsUODzgifj?=
	=?iso-8859-1?Q?cUhVGwB0Cae3cT+s6yIxx+yvCPVdbUsuBnqS8bCdz2jMzU3uQJW+luzsCb?=
	=?iso-8859-1?Q?4KL8MBna5FfMVVP/Xb7bWIf8C3+P/8Ymi0AcVW+bBI+LerqGhWDS21BtZD?=
	=?iso-8859-1?Q?i/wiulWVhtjt1d++fy844GqvV3I88xycBQVzZcpNI0PMEVzdF8TnBygHz1?=
	=?iso-8859-1?Q?I58GkzwukBf3MZ4oOnHC/3U9+dWB8gq0OYa6Z1DVsE7cxv+b1BUP+UuU2t?=
	=?iso-8859-1?Q?2h4xqYNqEf2U++XEt1FFLd7vzS1JGj8pEOBJ/ZHVmrdo5FdDIs0R4LvWUd?=
	=?iso-8859-1?Q?Ctshm2IDT0EgH/GOC2gOG5iq42yQMHGBeqUtLPs+MUnDG/AKjzNZmJhj4e?=
	=?iso-8859-1?Q?CIS87zOUQ4zd461o93H4zKFNjSH8V+fuhcvXmdXHRKIBxVbc90Enh6pWZO?=
	=?iso-8859-1?Q?4z5XEt2R4q9l146DNTCh9mQ+3V9IpzNkGcdop5wMnxXP/fD4DVT9LlaAqr?=
	=?iso-8859-1?Q?SAbUN1DnuwWV08UK+afO1gyv69vvgldaK5759lBjhYiPBXC2XtlWKNEgn0?=
	=?iso-8859-1?Q?jCT8ePB4PChRZgNn+TsBj6xQnSBsQcpIpcatPR+LifrdO4Q/PA+mnnV23f?=
	=?iso-8859-1?Q?uA/NZ+K/x5aNYtg6Tf0M5hma3fJXm?=
x-microsoft-antispam-prvs: <CY4PR04MB0985A139A4FD89413F4C6571907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(966005)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6306002)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F6qR/a0f7RtjrviX+Ib5pGyLhw4EVwZ/cqdb6zWd2w5cEmhn11Yb17CFeqkzjGkaaBIkhgW7s2L5U1dnHeftXPxLjajtq32hDd1txk34XSWWnDwD5OS9Y+m23ERJ3VDUAL1J6P7hYvE114f2kM0DqLwDeFUQdCdk9I1a8yKsSL6ZH+8R1PLyKzCcSQxTJqiqQN0VFqCDt+Q3ibH7qYPQQkQNOF6YhimSoKPRyCSsMarquGSsV2V3PF+hwtVEfSy8ljDvAzdM/GfkI6xX46AT2fjL15Pbw9STCtOE08RlwCp7Xtk8moIqDL0PQlz/IvE/AfEaVqaBKn+GX+YBUDLfIpaAyPGDtQDBQjvw/9cMu4cmdkNoMAcVVfjZR9TqkHsfAlJ3Q2vlq8Dq7C7M84l4n39hvLvA57FISSYnX/W0yI0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5cc961-0efb-4ba9-ed18-08d69795b634
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:18.0045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 07/11] RISC-V: Change local interrupts from
 edge to level
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
X-List-Received-Date: Thu, 21 Feb 2019 00:44:26 -0000

From: Michael Clark <mjc@sifive.com>

This effectively changes riscv_cpu_update_mip
from edge to level. i.e. cpu_interrupt or
cpu_reset_interrupt are called regardless of
the current interrupt level.

Fixes WFI doesn't return when a IPI is issued:

- https://github.com/riscv/riscv-qemu/issues/132

To test:

1) Apply RISC-V Linux CPU hotplug patch:

- http://lists.infradead.org/pipermail/linux-riscv/2018-May/000603.html

2) Enable CONFIG_CPU_HOTPLUG in linux .config

3) Try to offline and online cpus:

  echo 1 > /sys/devices/system/cpu/cpu2/online
  echo 0 > /sys/devices/system/cpu/cpu2/online
  echo 1 > /sys/devices/system/cpu/cpu2/online

Reported-by: Atish Patra <atishp04@gmail.com>
Cc: Atish Patra <atishp04@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 555756d40c..073bdcfe74 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -95,9 +95,9 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mas=
k, uint32_t value)
         cmp =3D atomic_cmpxchg(&env->mip, old, new);
     } while (old !=3D cmp);
=20
-    if (new && !old) {
+    if (new) {
         cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
-    } else if (!new && old) {
+    } else {
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
=20
--=20
2.20.1


