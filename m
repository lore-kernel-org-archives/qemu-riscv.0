Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6a-0004Je-3g
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6Y-0004DO-Ig
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0X-0006HE-Tz
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:07 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0Q-0006Dh-5b; Fri, 15 Mar 2019 21:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699259; x=1584235259;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=73CspTw5lbLP0cNYs/QODQbY7nmcTrIPl/GNDdDcWro=;
	b=GAYxZzwoFopzUKWou/GguKCuxWfVgqYAPyX8EX52Zk87DSHaBZhMYnoK
	XR4DryKzoGzZXs0SiZ1UOM+QxUVD6sfDJevmXx+++jbPFyKoJBsU7Dyt0
	xZPy7ed4Pbz9Y3jDi9dZBVKxkcNgLErY9gJO7dm/ZTbJvrMkjSqf3ktjz
	MpuIl9YVLdZEvvJIwPHV0uwBznmJL9ixI2L17tHT5YqzhwHfHF/d3GXZH
	uunZouf5psw1ylO9+FsF+7T0FCzgdtEt1jWi/1GU+lGtTZxcBifygpNCD
	h7lQCAJ/KsAVwp0hrPtHgeRGJjF3GYA+Pl5oUW8MMlINjQzNW3xq7pgvC A==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549475"
Received: from mail-dm3nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.53])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:20:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EGlLbzDzVt5sS4osM2B4hdQCKd+7qW2JrfgPWBVVrxA=;
	b=H6y5D1BxYKNEIFzEDx7ZwlisIw8H8Mqsx+WWh7vh0nVWLsq1up1s/xMKRS1ytw8ZmmZ0LOooOwQjIDerRetzaG50FGToiKYl7XzrJczvOgytJkgZXKHRalZR6YFrteMRjKTwOmc1Ooy5c8Q58q3kz9QPcKwxaizzE4fg0Yzbczs=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:20:55 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:20:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 07/12] RISC-V: Change local interrupts from edge to
	level
Thread-Index: AQHU25aAO96dBF6XoEKGIEvOogxAAg==
Date: Sat, 16 Mar 2019 01:20:54 +0000
Message-ID: <d89b01a4548886a325ca8bd7b59b302854181e18.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0064.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::41) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b10a361-1d60-48dc-620b-08d6a9ada2dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
x-ms-exchange-purlcount: 2
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59893036B05FAE1B09B8CF1690450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(6306002)(53936002)(68736007)(446003)(966005)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qjQJqGwNIPeoD7+JYXfaT7jXrJ+5VVAkcyOCw8R1hkws7I3nVzI0slh7yRR5+Hl+jf4+9/bnRTw9z8wDqSBf3jlp3qwpNyn4nw2lMMQ2Qq3AM3P8/1D3X1YB/1xXLGJqHkDuJV0FIRygMvdeWTVLnqVBZWvuUmqo/j0ubDQelOcbjm1NDiStt9wVm7u5ofDNJ7nMA+NAV8oTwkY5E195pIpqOi6KAbQ4X9Ee9UXGzn6LkDMsjK+xRgcLL7nlQUpTYx5dM2wg7h7iK1SUFi8wCUdkaLwCL99DJiueFrAicutNYgz/7OT2yOqBSrdJMah9INuAwNRnSztWIcbK6nKhcldoadQnUO51bZMZS2oWqSxRsZEgkOrC2xSI6brylB0jari65IOzyhWx2GFmA9AaZoLogFu0GPJZ6Snut5o0Alc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b10a361-1d60-48dc-620b-08d6a9ada2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:20:54.8143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 07/12] RISC-V: Change local interrupts from
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:19 -0000

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
2.21.0


