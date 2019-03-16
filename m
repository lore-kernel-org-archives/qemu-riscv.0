Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6a-0004KE-FZ
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6W-00047t-BX
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0i-0006Mg-8s
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0g-0006MJ-Tf; Fri, 15 Mar 2019 21:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699275; x=1584235275;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=x8lQNO5paCWkVCC0cFa1W9TgFUEqQQxK7FdGwjLUJ4c=;
	b=hZuaBq70wdJzlhFdYKQ4G6ymgQ+OhDx2rnosWLyeqeGiGyqatr0ZP8ri
	RvNbPBJbIIY01OPDD+jorqjUwGbX+hRsNfZIa615DWrtwioeV7Jqq/74K
	flAdxmGXOaWzq2cg3mZjTqDZ9sxZg8TKd6rBgSo+crEmTMRiAnAN5jzmW
	bKHBG0RnAPhk0UZD/VGZ87fJ7CbYabYCfQQLasYQJo1FZUHteRbfDzmmi
	TBQjNmJDUyURRpN6zFuWJgqQ6/6nrcbrq4MFohbYv1fjjsS4ZaQbLF8cm
	G6NhqJ3I2Xs3gzMAxRd2S+SziWaK0F52l+HuvQrXU+UGWOPlXIaYn1g2t A==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549496"
Received: from mail-dm3nam05lp2057.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.57])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=B0dn5n4dfO2443E+WQhSNfgevtRsGFiOhcIlKBS8vr8=;
	b=HuFLMWnEPSwtS7KwqVCQYRKNSqehW/Oa9QRimyIhaoEEjCj7O7EKI97q2v1Um8GX7IzcbllKV5LbbMWZkPnWMtlrng/k+u4etLk8coxUEiTH8yeutyocnJYlUFxTQHT07LZkbEwuk5tqeK4sWVotsXYTdNzT4T/YOkAOjvsUHkE=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:21:12 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:21:12 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 09/12] RISC-V: Convert trap debugging to trace events
Thread-Index: AQHU25aKhOEDzmTOS029etJsSPLifg==
Date: Sat, 16 Mar 2019 01:21:12 +0000
Message-ID: <7a94334023d7306864826e7a13ba41f8e53ba29a.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR11CA0091.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::32) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6af2112c-5594-41c5-af01-08d6a9adad1e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59899E4AC574C12C1699334090450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ptY0lhbjkdBFgMLAAdMV+pUKmT2uw5R0UMGpATkQi3/PGFxgg/YhpmbpD6XXkNUxd16yvGX6aMBlBUgJTd1oedk67x6etjnZONt8UDqR8xVix0O8ZbGxiynYMRgQ2LqMasyy3YTGLnLSfARxmL3GVFAcmJRyKOxqyQSgUZduFNKefq7DlBn8OXnvGQX2QUJl2+Ybg72hlw6ga99Iu4z6KsJnuW3lrBKOUhd4DrMlOzBzeIq1VX9twQ9YcRvzJzBt4UBeWf2xFM3KcMuiibrZz6ZP9a0tqihgbSWltlj9aZW/Pn4cbQ3kAYkLpeOyAemoYaxspWq3r1RHr9C0uC0p/GxnJqSCeHq+PpnbWKhBGF0Y9+KaVguO4tE1wvb8kHXjGdA6+jVX07wE4rwcoTHNawQH+PKW0jQWNX53X1dGKGc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af2112c-5594-41c5-af01-08d6a9adad1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:21:12.0150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 09/12] RISC-V: Convert trap debugging to
 trace events
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:17 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 Makefile.objs             |  1 +
 target/riscv/cpu_helper.c | 12 +++---------
 target/riscv/trace-events |  2 ++
 3 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 72debbf5c5..cf065de5ed 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -186,6 +186,7 @@ trace-events-subdirs +=3D target/hppa
 trace-events-subdirs +=3D target/i386
 trace-events-subdirs +=3D target/mips
 trace-events-subdirs +=3D target/ppc
+trace-events-subdirs +=3D target/riscv
 trace-events-subdirs +=3D target/s390x
 trace-events-subdirs +=3D target/sparc
 trace-events-subdirs +=3D ui
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a02f4dad8c..6d3fbc3401 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,8 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
-
-#define RISCV_DEBUG_INTERRUPT 0
+#include "trace.h"
=20
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -493,13 +492,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
=20
-    if (RISCV_DEBUG_INTERRUPT) {
-        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
-            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
-            env->mhartid, async ? "intr" : "trap",
-            (async ? riscv_intr_names : riscv_excp_names)[cause],
-            env->pc, tval);
-    }
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 16=
 ?
+        (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)"=
);
=20
     if (env->priv <=3D PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
new file mode 100644
index 0000000000..48af0373df
--- /dev/null
+++ b/target/riscv/trace-events
@@ -0,0 +1,2 @@
+# target/riscv/cpu_helper.c
+riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, uint=
64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", ep=
c:0x%"PRIx64", tval:0x%"PRIx64", desc=3D%s"
--=20
2.21.0


