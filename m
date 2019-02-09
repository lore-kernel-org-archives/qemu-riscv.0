Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0v-00061H-23
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:01:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0r-0005xA-Or
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0q-0007nt-1J
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:57 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43787)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0n-0007XW-3D; Fri, 08 Feb 2019 20:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674053; x=1581210053;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=/gOAmNvsydMG67UaJC2PD2qnb65CTzoNUErgLy0F96s=;
	b=mh1diVd3GW+6NUa9BlCJTEOwaRCSvSE42ukqeV15G8GJNKR7JfsbIRfl
	xgJrAouu6h+S6JY+IacpJ/Cv8IyVOsXaMXU9qw1wWma9CRaTU9D45NgYm
	oDsB83i5fAEtl7n5V/fTKQEDvyl+Zrk1iIhJDV1VbK34WQfEFa1tmxHWV
	2AsC/r0g2sIA1AMC7DIvUrb7Ro2+jP2mAJqBzKd0VFQJHbm17t2ApNdZp
	6E8ScP5FRCFubboMZNWnM9oPCLZwsk7RGKn2HWKA5eviExnWD8dqNhZPK
	byN79cgpQNanGlvmCy2LrOEPbqSrNUJBUGAEBNq5rci3Tr4HTR3Pw2319 w==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="205937719"
Received: from mail-by2nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.50])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/kUQ29t5TrfYlfzqWOQXVR8Cybxb9FdATw7XRW5RQBw=;
	b=fRfJRFWxoKfQMkAYLtk5VSe6FypNOo4VVXcmJQe1jIS+IYvqd4ZzyzBTRA5rQnhfUK3tnxPGtBFcVowNShlISi+C8KVWh5lp3OUVvsNXwmnQqiw58Mi8ny1Tbz7C7ndWvUWlVAr7ReB3yXEpFgukl4IOzdCWo7agMzB/HtG5Zpw=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:33 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:33 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 08/11] RISC-V: Change local interrupts from edge to
	level
Thread-Index: AQHUwBLblBDj8Nkt/UmFryx5VjyNww==
Date: Sat, 9 Feb 2019 01:00:33 +0000
Message-ID: <ebecb5dfd7331ba1078dbf52f623cf82fed6ceb1.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
	To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:5De+Tct7E92iwt6IZzFhSLtzZktobml03AoZFvjyH9A/JvU+f3YFSuJK7rrQSoOxEBYJXwN04sl+IZGPhVDmI8TvwbIdiOQHgrobklqRXLxMsVcy6SQFhIdGe60S3CGTDVSz0beYhfPIEXjVnA+usqQw3HzWiLarme8T7H9QEUJzlZIWe1y97iXcVhE4rVBP8cx5kt3Ea3Mtjb+MHGQz5qhrZ95T3sx8VjWQaG5EUI8bgugCu6+FXs3HR7Vsn48jQng/Fa4CFFydtHzxBEwMtXnwkFj+MqIy8k5Z+Bnr0jr37IA7q0wQIiCcVQKvBkrJTA4giiLXZcfeuaKChdq0f+9EJ8m+KuXKvKZ11BG4CkahGXvsJ+vW7Iy18qxEdv7n0tZ3jzHa9ptU1jIcD4Zw7l3bmRmjAHBKMD9LnYxupFPllAKqzi05CGWdo69Xw8KL15jmbHFfaPzV6yd17cEjtA==;
	5:I/N/BPDkLkzZPDhbELeZxWCQ/oN5S18VtcAsLJ84zi384DhzpNHllg5/UlgWj4fUWzY/Z8aT36V21X6Z6Rs3R4LnQdzoTJUQbJSf771h+jmZaajrNMfr1PzrqrDvr4prCN2Cc0d5VYq6io8d2zCV+BdvU26GCKJ41QX8TNfG31HRBg3AzmJSDIlYRJiIcu0VcyDNviCzUp/CC/67mKHG5Q==;
	7:49s6k6FuE1hDu+IXLvY4B5qlDPFeRDYrh6n4wO/HH9IpRwfePrfqc26jxnZ0ki9eKQ2w2dqV1uK/oIhKX/LumQR+fYUu7XVQYiJH5SnJAzSrBt1mSOa4BifBPZrPmLI89KaTxvc2b7x3BqAiqIzHbw==
x-ms-office365-filtering-correlation-id: 135e4669-ef35-4671-6ab2-08d68e29fe21
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
x-ms-exchange-purlcount: 2
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409AD865FA2E8667AE8EC8C906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(6306002)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(966005)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EtXQzn3F56taBf4KAlvuY/uh3RxMNa7KwZxT207AK92jvoBBYaDkAJccizRfG8oyQYdchf+sfH33E+8GD56glkvR0yfi0Cfo1HbfnsuzG8TyZ2WzVKQPLdNzurqh3RIf0ipO+eec+5JH9oyEF6D2CwF4/QQfn7mCWNqivt/oX+c5VyXkBnE2nznnCIT+RYZ8caguEMI1mYMvo8gz/zvl4bZSsJzNYXvCpvBdffCKBeXiZicBSv5PXCPoTZDnzoJ0nVo0FeAXW5PucdaHYEr4LUW/L+Ghuv1zCezzgkMhFce+v8uLdi0M9PA2FvNRgFrL2wd6kl1iG+fNYe9Z39UGBvudHiOK4P3Wec1VDMdnX/lUxkOxlVLEcP5rXuxUNXwQhXkKasY2MMsEbVUe/gSMI2HRdFK5Hqf78KPYReypmrs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135e4669-ef35-4671-6ab2-08d68e29fe21
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:32.5918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 08/11] RISC-V: Change local interrupts from
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
X-List-Received-Date: Sat, 09 Feb 2019 01:00:59 -0000

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


